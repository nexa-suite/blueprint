# Camera

TARGET DEFINED; IMPLEMENTATION NOT YET VERIFIED. Operations construction uses
CameraX with ML Kit Barcode Scanning bundled model and mandatory manual
identification fallback. Supported V1 input classes are EAN, UPC and QR; GS1
remains future runway unless current Product evidence changes that boundary.

Interpret only encoded data. Never fabricate lot, expiry, SKU or quantity from
missing barcode data; request missing values explicitly. Scanning is input
assistance, not authority. API/server remains authority for catalog, inventory,
lot, expiry, quantity and business lifecycle facts. Evidence capture is used by
Warehouse, Dispatch and Delivery. Scanner is not a Bounded Context.
