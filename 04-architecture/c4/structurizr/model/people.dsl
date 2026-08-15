prospectiveCustomer = person "Prospective Customer Representative" "Evaluates Nexa and requests contact or a product demonstration"
internalTenantWorkforce = person "Internal Tenant Workforce" "Grouped C4 actor for the shared internal surface: Tenant Administrator governs technical access; Company Owner governs company identity and workforce governance; Business Operations Manager supervises operations; Sales Representative manages commercial work; Warehouse Operator manages inventory; Dispatch Coordinator manages delivery execution"
b2bBuyer = person "B2B Buyer" "Uses private Buyer experiences across authorized Tenant relationships; Buyer is not workforce membership"

deliveryDriver = person "Delivery Driver" "Executes future delivery workflows" {
    tags "Future"
}
nexaPlatformAdministrator = person "Nexa Platform Administrator" "Governs future platform-wide administration" {
    tags "V2/Future"
}
nexaSupportSpecialist = person "Nexa Support Specialist" "Provides future Nexa support" {
    tags "V2/Future"
}
