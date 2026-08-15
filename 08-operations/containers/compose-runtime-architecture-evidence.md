---
status: evidence
scope: AS-IS local runtime
owner: architecture
last-reviewed: 2026-08-14
---

# Docker Runtime Architecture Evidence

## 1. Alcance y fuente de verdad

Esta evidencia describe exactamente el Compose Modern local vigente, sin convertirlo en una arquitectura de producción:

- Fuente: `10-repositories/active/api/ops/compose/modern.compose.yml`.
- Proyecto Compose: `nexa-modern`.
- SHA-256 observado: `6a3d3db77c0d32da822333a225624c848eeaae290b5e1a41728a7796102f7205`.
- Validación: Docker Compose `v5.3.1`; `config --quiet` pasó con y sin `--profile observability`.
- Los valores de `10-repositories/active/api/.env.local` no se registran aquí.

El archivo `10-repositories/active/api/ops/compose/compose.yml` también existe, pero representa el Compose dual Modern/Legacy con perfiles `modern` y `legacy`. Esta matriz no lo mezcla con el runtime Modern operado por `ops/compose/scripts/modern-up.sh`, `modern-down.sh` y `status.sh`. El README del repositorio API que todavía llama a `compose.yml` “canonical dual runtime” se clasifica aquí como documentación desactualizada respecto de la operación Modern actual; no se modifica como parte de esta tarea.

Clasificación: AS-IS local. No es diseño TARGET, decisión de proveedor ni evidencia de despliegue productivo.

## 2. Inventario exacto por servicio

| Service | Image | Responsibility | Dependency | Network | Volume | Healthcheck | Profile | Port | Dev-only? | Production analogue? | Security implication |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `modern-postgres` | `postgres:18.4-alpine` | Base de datos PostgreSQL del runtime Modern V1; persiste estado de aplicación y recibe migraciones desde API. | Ninguna declarada. | `modern-data` → `nexa-modern-data`. | `nexa-modern-postgres-data:/var/lib/postgresql`. | `pg_isready -U $$POSTGRES_USER -d $$POSTGRES_DB`; cada 5 s, timeout 3 s, inicio 10 s, 20 reintentos. | Default; sin `profiles`. | Ningún `ports`: solo accesible por red Compose. | La instancia sí es local/dev; la capacidad PostgreSQL no es dev-only. | Servicio PostgreSQL de producción; proveedor, topología y HA no definidos. | No se publica al host, reduciendo exposición. Las credenciales llegan por variables de entorno. `modern-data` no declara `internal: true` en este archivo, por lo que la segmentación de red no es una barrera completa. |
| `modern-api` | `nexa/modern-api:local`; build `../../../api/Dockerfile`. | API Spring Boot de Nexa: negocio, persistencia, Flyway, IAM e integraciones locales. | `modern-postgres`, `modern-mailpit`, `modern-minio`, `modern-clamav` y `modern-stripe-mock`, todos con `condition: service_healthy`. Usa además endpoints configurados para SMTP, MinIO y ClamAV. | `modern-edge` con alias `api` y `modern-data` → `nexa-modern-edge`, `nexa-modern-data`. | Bind read-only de `.local-keys/access-token-public.pem` y `access-token-private.pem` a `/run/secrets/...`; `nexa-modern-object-storage:/app/.local-object-storage`. | `/usr/local/bin/nexa-healthcheck` → `/actuator/health`; cada 10 s, timeout 5 s, inicio 20 s, 12 reintentos. | Default; sin `profiles`. | `127.0.0.1:8080:8080`. | La imagen/tag son locales; el servicio API no es dev-only como capacidad. | Servicio/API de producción detrás de la exposición definida por deployment; plataforma de ejecución, ingress y secretos no definidos. | El binding loopback limita exposición local. La configuración contiene credenciales DB, claves operativas, token de system operator y credenciales MinIO en entorno; las claves RSA privadas se montan read-only. El perfil por defecto incluye `local,minio`, y existen variables de bootstrap/demo que deben permanecer deshabilitadas fuera de un entorno controlado. |
| `modern-mailpit` | `axllent/mailpit:v1.26.0` | Sink SMTP e interfaz local para inspeccionar correos durante desarrollo/pruebas. | Ninguna declarada; API espera su healthcheck. | `modern-edge` → `nexa-modern-edge`. | Ninguno. | `wget --spider --quiet http://127.0.0.1:8025/`; cada 5 s, timeout 3 s, inicio 5 s, 12 reintentos. | Default; sin `profiles`. | `127.0.0.1:8025:8025`. | Sí, esta implementación es local/dev/test. | Límite aceptado `Email Delivery Service`; Mailpit no es el proveedor productivo. | El loopback evita publicación externa normal, pero captura mensajes potencialmente sensibles; no debe exponerse ni tratarse como servicio de correo productivo. |
| `modern-minio` | `minio/minio:RELEASE.2024-10-13T13-34-11Z`. | Implementación local del límite Object Storage compatible con S3; crea/expone el bucket configurado. | Ninguna declarada; API espera su healthcheck. | `modern-edge` y `modern-data` → `nexa-modern-edge`, `nexa-modern-data`. | `nexa-modern-minio-data:/data`. | Configura alias `local`, crea bucket y ejecuta `mc ready local`; cada 5 s, timeout 5 s, inicio 10 s, 20 reintentos. | Default; sin `profiles`. | `127.0.0.1:9000:9000` API; `127.0.0.1:9001:9001` consola. | La instancia sí es local/dev; la capacidad Object Storage no es dev-only. | Object Storage tenant-owned; proveedor de producción no seleccionado. | Usa `MINIO_ROOT_USER`/`MINIO_ROOT_PASSWORD` y los reutiliza como credenciales de API. La cuenta root es más privilegiada de lo necesario para una aplicación; la consola queda accesible localmente. El volumen persiste contenido local y requiere control de acceso/backup fuera de este Compose. |
| `modern-clamav` | `clamav/clamav-debian:1.4.3`. | Servicio local de análisis antimalware para archivos cargados. | Ninguna declarada; API espera su healthcheck. | `modern-data` → `nexa-modern-data`. | Ninguno declarado. | `clamdscan --ping 1`; cada 10 s, timeout 5 s, inicio 45 s, 18 reintentos. | Default; sin `profiles`. | `127.0.0.1:3310:3310`. | La instancia es local/dev/test; la capacidad de scanning no es necesariamente dev-only. | Adaptador/servicio de malware scanning para producción; despliegue y proveedor no definidos. | No necesita publicación al host para la comunicación API-Compose; el binding loopback añade una superficie local innecesaria. La imagen y las firmas/actualizaciones no se fijan ni documentan aquí como política de seguridad productiva. |
| `modern-stripe-mock` | `wiremock/wiremock:3.13.1`. | Test double del Payment Provider; responde con mappings locales para flujos deterministas. | Ninguna declarada; API espera su healthcheck. | `modern-edge` → `nexa-modern-edge`. | Bind read-only `./stripe-mock/mappings:/home/wiremock/mappings`. | `GET /__admin/health`; cada 5 s, timeout 3 s, inicio 10 s, 18 reintentos. | Default; sin `profiles`. | `127.0.0.1:12111:8080`. | Sí; no representa un proveedor real. | Límite aceptado `Payment Provider`; en producción debe existir un adapter/proveedor real, no WireMock. | Su presencia en el conjunto default puede hacer pasar integraciones sin probar el proveedor real. El puerto queda local, pero sus mappings y respuestas no deben confundirse con evidencia de autorización, liquidación o webhook productivo. |
| `modern-platform` | `nexa/modern-platform:local`; build `../../../platform/Dockerfile`. | Internal Web Platform para roles internos de Tenant; sirve el frontend Angular compilado con Nginx y proxy local al API. | `modern-api` con `condition: service_healthy`. | `modern-edge` → `nexa-modern-edge`. | Ninguno. | `/usr/local/bin/nexa-healthcheck`: `/health` y `/api-health`; cada 10 s, timeout 5 s, inicio 5 s, 12 reintentos. | Default; sin `profiles`. | `127.0.0.1:4200:80`. | La imagen es local; la aplicación no es dev-only como capacidad. | Servicio de entrega del Internal Web Platform detrás de ingress/edge productivo; hosting no definido. | Loopback limita exposición del host local. No hay TLS, WAF, ingress ni política de headers productiva en este Compose; el artefacto local no prueba esos controles. |
| `modern-portal` | `nexa/modern-portal:local`; build `../../../portal/Dockerfile`. | Buyer Portal para autoservicio de compradores; sirve el frontend Angular compilado con Nginx y proxy local al API. | `modern-api` con `condition: service_healthy`. | `modern-edge` → `nexa-modern-edge`. | Ninguno. | `/usr/local/bin/nexa-healthcheck`: `/health` y `/api-health`; cada 10 s, timeout 5 s, inicio 5 s, 12 reintentos. | Default; sin `profiles`. | `127.0.0.1:4300:80`. | La imagen es local; la aplicación no es dev-only como capacidad. | Servicio de entrega del Buyer Portal detrás de ingress/edge productivo; hosting no definido. | Loopback limita exposición del host local. El Compose no demuestra TLS, CDN/WAF, CSP, rate limiting ni controles de producción del edge. |
| `modern-jaeger` | `jaegertracing/all-in-one:1.76.0`. | Backend local de trazas y UI Jaeger; OTLP habilitado por `COLLECTOR_OTLP_ENABLED`. | Ninguna declarada. | `modern-edge` → `nexa-modern-edge`. | Ninguno declarado. | No definido. | `observability`; excluido por defecto. | `127.0.0.1:16686:16686` UI; `127.0.0.1:4318:4318` OTLP HTTP. | Sí, observabilidad local. | Backend de tracing productivo; plataforma, retención y proveedor no definidos. | No tener healthcheck impide una condición Compose de salud para consumidores. La UI/OTLP se limita a loopback, pero puede contener datos sensibles de trazas; no hay autenticación/TLS configurados en este archivo. |
| `modern-otel-collector` | `otel/opentelemetry-collector-contrib:0.132.0`. | Collector local OTLP HTTP; reenvía traces a `modern-jaeger:4317` según `otel-collector-config.yml`. | `modern-jaeger` con `condition: service_started`, no `service_healthy`. | `modern-edge` → `nexa-modern-edge`. | Bind read-only `./otel-collector-config.yml:/etc/otelcol-contrib/config.yml`. | No definido. | `observability`; excluido por defecto. | Ningún puerto publicado; escucha internamente según su configuración. | Sí, observabilidad local. | Collector/gateway de telemetría productivo; topología y proveedor no definidos. | La dependencia solo espera proceso iniciado, no disponibilidad real. El bind de configuración es read-only, pero no hay TLS/auth en el pipeline local; no se debe reutilizar como configuración productiva sin revisión. |

## 3. Redes y volúmenes declarados

### Redes

| Compose key | Docker network name | Services | Justificación AS-IS |
|---|---|---|---|
| `modern-edge` | `nexa-modern-edge` | API, Mailpit, MinIO, Stripe Mock, Platform, Portal, Jaeger y OTEL Collector. | Red de interacción de aplicaciones, adapters locales y observabilidad. No tiene `internal: true` en este archivo. |
| `modern-data` | `nexa-modern-data` | PostgreSQL, API, MinIO y ClamAV. | Segmenta DB, almacenamiento, scanning y API del edge; no tiene `internal: true` en este archivo. |

La conexión API-PostgreSQL usa `modern-postgres:5432`; API-MinIO usa `modern-minio:9000`; API-ClamAV usa `modern-clamav:3310`; API-SMTP usa `modern-mailpit:1025`. El alias Compose `api` existe únicamente para `modern-api` en `modern-edge`.

### Volúmenes y mounts

| Resource | Type | Target | Content/role |
|---|---|---|---|
| `nexa-modern-postgres-data` | Named volume | `/var/lib/postgresql` | Persistencia local PostgreSQL tal como está declarada; no se infiere una política de backup. |
| `nexa-modern-object-storage` | Named volume | API `/app/.local-object-storage` | Persistencia local adicional montada en API; su existencia no convierte el volumen en Object Storage productivo. |
| `nexa-modern-minio-data` | Named volume | MinIO `/data` | Persistencia local de objetos MinIO. |
| `../../.local-keys/access-token-public.pem` | Bind, read-only | API `/run/secrets/nexa_access_token_public` | Clave pública RSA local. |
| `../../.local-keys/access-token-private.pem` | Bind, read-only | API `/run/secrets/nexa_access_token_private` | Clave privada RSA local; requiere protección del host. |
| `./stripe-mock/mappings` | Bind, read-only | WireMock `/home/wiremock/mappings` | Contratos/respuestas del test double de pagos. |
| `./otel-collector-config.yml` | Bind, read-only | OTEL `/etc/otelcol-contrib/config.yml` | Configuración local de recepción OTLP y exportación a Jaeger. |

## 4. Dependencias y orden de arranque

```text
modern-postgres ─┐
modern-mailpit ──┤
modern-minio ────┤
modern-clamav ───┼──(healthy)──> modern-api ──(healthy)──> modern-platform
modern-stripe-mock┘                              └──────> modern-portal

modern-jaeger ──(started)──> modern-otel-collector   [profile observability]
```

Estas condiciones son garantías de orden de arranque de Docker Compose local. No son una estrategia de disponibilidad, autoscaling, failover, rollout, secreto, backup o recuperación productiva.

Observaciones exactas:

- Solo `modern-api`, `modern-platform`, `modern-portal` y `modern-otel-collector` tienen `depends_on`.
- `modern-api` exige cinco healthchecks antes de arrancar.
- Platform y Portal exigen API saludable, no solo iniciada.
- OTEL Collector exige que Jaeger esté iniciado, no saludable.
- Jaeger y OTEL Collector no declaran `healthcheck`.
- Los servicios base no tienen `profiles` y, por tanto, forman parte del conjunto default; solo Jaeger y OTEL Collector requieren `--profile observability`.

## 5. Justificación formal

### Adecuación para evidencia local

El Compose es adecuado como fixture de runtime local porque reúne la API, las dos superficies web Modern, PostgreSQL, almacenamiento de objetos local, SMTP inspeccionable, scanning, un Payment Provider test double y observabilidad opcional. Los puertos publicados están ligados a `127.0.0.1`, PostgreSQL no se publica al host y los consumers usan nombres de servicio Compose. Los healthchecks permiten que la secuencia local espere dependencias funcionales básicas antes de iniciar consumidores.

### Límites de producción

No es válido interpretar las imágenes locales, los named volumes, Mailpit, WireMock, Jaeger all-in-one, claves del host ni la ausencia de controles TLS/edge como arquitectura productiva. La documentación canónica acepta los límites abstractos Payment Provider, Email Delivery Service, Maps/Geolocation Provider y Object Storage, pero no ha seleccionado proveedores, topología, HA, secretos, backup/restore, DR, SLO, alerting o rollback productivos.

### Implicaciones de seguridad que deben conservarse como riesgos abiertos

1. El loopback binding reduce exposición local, pero no sustituye autenticación, TLS, autorización, aislamiento de red ni hardening productivo.
2. `modern-data` no está marcado `internal: true`; la separación por attachment es una defensa de alcance limitado.
3. El API recibe secretos sensibles por environment y utiliza credenciales root de MinIO para el adapter local; producción requiere revisión de least privilege y secret management.
4. La clave privada RSA se monta desde el host. Su protección, rotación y distribución productivas no están definidas aquí.
5. El conjunto default incluye WireMock y Mailpit, por lo que un check verde local no demuestra integración con proveedores reales ni entrega externa de correo.
6. Las referencias de imagen son tags versionados, no digests content-addressed en Compose; la reproducibilidad y política de provenance de producción siguen abiertas.
7. El proyecto Compose fijo `nexa-modern` puede colisionar con contenedores de otros checkouts que reutilicen el mismo nombre. El estado observado en esta máquina tenía contenedores detenidos con labels de checkouts temporales/históricos; se clasifica como evidencia de higiene operativa local, no como cambio de runtime.

## 6. Validación reproducible y no mutante

Ejecutado desde `10-repositories/active/api` sin imprimir secretos:

```bash
docker compose --env-file .env.local \
  -f ops/compose/modern.compose.yml config --quiet

docker compose --profile observability --env-file .env.local \
  -f ops/compose/modern.compose.yml config --quiet
```

Resultado: ambos comandos pasaron. También se ejecutó `docker compose ... ps --all --format json` solo para inspección; no se hizo `up`, `down`, build, pull, prune, cambio de volumen ni modificación de runtime.

## 7. C4, Docker Compose y deployment no son la misma vista

La relación canónica es una traducción entre tres preguntas distintas:

- **C4 Container View:** ¿qué aplicaciones y almacenes componen Nexa?
- **Docker Compose:** ¿qué procesos y sustitutos se ejecutan juntos en este entorno local?
- **Cloud Deployment View:** ¿cómo se ejecutan en producción, con qué disponibilidad, red, secretos, backup y operación? Esta vista todavía no está definida.

| C4 element | Implementación local AS-IS | Responsabilidad productiva futura |
|---|---|---|
| Public Website | Repositorio `active/website`, Dockerfile Nginx o servidor estático independiente; no pertenece a `modern.compose.yml`. | Hosting/edge estático y publicación productiva por decidir. |
| Internal Web Platform | `modern-platform` sirviendo Angular compilado con Nginx en `127.0.0.1:4200`. | Hosting/edge de la aplicación interna, TLS, routing y controles productivos por decidir. |
| Buyer Portal | `modern-portal` sirviendo Angular compilado con Nginx en `127.0.0.1:4300`. | Hosting/edge del Portal, TLS, routing y controles productivos por decidir. |
| Nexa Application API | `modern-api`, imagen local construida desde `active/api`, puerto local `8080`. | Proceso API detrás de la exposición/ingress definida por deployment; escalado y secretos por decidir. |
| PostgreSQL Database | `modern-postgres`, red `modern-data`, volumen local `nexa-modern-postgres-data`, sin puerto de host. | PostgreSQL gestionado o autogestionado; HA, backup, DR y topología por decidir. |
| Object Storage | `modern-minio` y volúmenes locales; el API también conserva un adapter local de filesystem según perfil. | Storage S3-compatible tenant-owned; proveedor, lifecycle, backup y delivery por decidir. |
| Email Delivery Service | `modern-mailpit` como sink SMTP en `127.0.0.1:8025`. | Servicio de entrega real, identidad de dominio, secretos, reputación y observabilidad por decidir. |
| Payment Provider | `modern-stripe-mock` con WireMock en `127.0.0.1:12111`; es un test double. | Provider/adaptador real, webhooks, credenciales, conciliación y SLA por decidir. |
| Maps & Geolocation Provider | `LocalDeterministicMapAdapter` por defecto en el API; `GoogleMapsRoutingAdapter` solo con perfil/configuración externa. No hay servicio Maps en Compose. | Provider, credenciales, cuotas y operación por decidir. |

El mapping no convierte cada fila local en un nuevo C4 Container. En particular:

| Servicio/runtime local | Clasificación | Motivo de exclusión o relación |
|---|---|---|
| `modern-api`, `modern-platform`, `modern-portal` | **PRODUCT C4 CONTAINER** | Implementan los tres procesos de aplicación de V1; API, Platform y Portal son containers C4. |
| `modern-postgres` | **PRODUCT C4 CONTAINER / DATA INFRASTRUCTURE** | Es el datastore PostgreSQL C4 y su ejecución local Docker. |
| `modern-minio` | **PRODUCT C4 CONTAINER / LOCAL ADAPTER** | Implementa localmente el límite C4 Object Storage; MinIO no es el nombre del proveedor productivo. |
| `modern-mailpit` | **LOCAL ADAPTER / PROVIDER SUBSTITUTE** | Sink SMTP de desarrollo/pruebas; no es Email Delivery Service productivo. |
| `modern-stripe-mock` | **LOCAL ADAPTER / PROVIDER SUBSTITUTE** | WireMock determinista; no es Payment Provider productivo. |
| `modern-clamav` | **SECURITY INFRASTRUCTURE** | Scanner antimalware local invocado por un adapter del API; no es una aplicación de producto V1 independiente en el L2 primario. |
| `modern-otel-collector`, `modern-jaeger` | **OBSERVABILITY INFRASTRUCTURE** | Pipeline y backend local de telemetría; no son comportamiento Nexa ni providers de negocio. |
| Structurizr Local | **ARCHITECTURE TOOLING** | Viewer/validador de los modelos; se opera desde `tooling/structurizr`, fuera del runtime Modern. |
| `LocalDeterministicMapAdapter` y adapters de integración dentro del API | **LOCAL ADAPTER / PROVIDER SUBSTITUTE** | Sustituyen o encapsulan providers; no crean containers C4 por existir como clases. |

Por la misma razón, `Workspace`, los schemas PostgreSQL y los módulos Java no aparecen como containers adicionales.

## 8. Decisión de cierre

La evidencia de arquitectura Docker local queda documentada para los diez servicios declarados por `modern.compose.yml`, con sus imágenes, responsabilidades, dependencias, redes, volúmenes, healthchecks, perfiles, puertos, clasificación dev-only, analogía productiva abstracta e implicaciones de seguridad. El mapping C4/Compose/deployment mantiene la distinción entre modelo semántico, runtime local y producción futura. La tarea no autoriza ni implica cambios al Compose, selección de proveedores, hardening productivo, releases o modificaciones Git.
