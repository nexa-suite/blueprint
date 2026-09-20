dynamic nexa.applicationApi "Nexa-Workflow-SubmitPurchaseRequest" "Submit Purchase Request: atomic commitment and protection precede asynchronous publication" {
    b2bBuyer -> nexa.buyerPortal "1. Submit Purchase Request"
    nexa.buyerPortal -> nexa.applicationApi.apiPresentation "2. Send authorized command"
    nexa.applicationApi.apiPresentation -> nexa.applicationApi.apiApplication "3. Invoke submit use case"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.targetCommercialCommitment "4. Establish Commercial Commitment"
    nexa.applicationApi.targetCommercialCommitment -> nexa.applicationApi.targetInventoryAvailability "5. Protect inventory atomically"
    nexa.applicationApi.targetCommercialCommitment -> nexa.applicationApi.targetCreditReceivables "6. Evaluate applicable credit atomically"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiPersistence "7. BEGIN local transaction and persist business mutations"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "8. Write authoritative scoped state"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiReliability "9. Insert outbox fact in the same local transaction"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "10. Write outbox beside authoritative state"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "11. COMMIT authoritative state and outbox atomically"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "12. Later publisher reads committed outbox"
    nexa.applicationApi.apiReliability -> nexa.applicationApi.apiIntegrations "13. Publish at-least-once after commit"
    autolayout lr
}

dynamic nexa.applicationApi "Nexa-Workflow-ConfirmDirectOrder" "Confirm Direct Order: Commercial Commitment, Inventory and Credit are all-or-nothing" {
    b2bBuyer -> nexa.buyerPortal "1. Confirm direct-order intent"
    nexa.buyerPortal -> nexa.applicationApi.apiPresentation "2. Send authorized command"
    nexa.applicationApi.apiPresentation -> nexa.applicationApi.apiApplication "3. Invoke confirm use case"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.targetCommercialCommitment "4. Create confirmed Commercial Commitment/Sales Order boundary"
    nexa.applicationApi.targetCommercialCommitment -> nexa.applicationApi.targetInventoryAvailability "5. Establish inventory protection in same decision"
    nexa.applicationApi.targetCommercialCommitment -> nexa.applicationApi.targetCreditReceivables "6. Establish applicable credit protection in same decision"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiPersistence "7. BEGIN local transaction and persist all-or-nothing result"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "8. Write authoritative scoped state"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiReliability "9. Insert outbox fact in the same local transaction"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "10. Write outbox beside authoritative state"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "11. COMMIT authoritative state and outbox atomically"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "12. Later publisher reads committed outbox"
    nexa.applicationApi.apiReliability -> nexa.applicationApi.apiIntegrations "13. Publish at-least-once after commit"
    autolayout lr
}

dynamic nexa.applicationApi "Nexa-Workflow-ConvertPurchaseRequestToSalesOrder" "Convert Purchase Request to Sales Order without release/re-reserve gap" {
    salesRepresentative -> nexa.internalWebPlatform "1. Review accepted Purchase Request"
    nexa.internalWebPlatform -> nexa.applicationApi.apiPresentation "2. Send conversion command"
    nexa.applicationApi.apiPresentation -> nexa.applicationApi.apiApplication "3. Invoke conversion use case"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.targetCommercialCommitment "4. Continue Commercial Commitment"
    nexa.applicationApi.targetCommercialCommitment -> nexa.applicationApi.targetInventoryAvailability "5. Preserve inventory protection"
    nexa.applicationApi.targetCommercialCommitment -> nexa.applicationApi.targetCreditReceivables "6. Preserve/adjust applicable credit protection"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiPersistence "7. BEGIN local transaction and persist Sales Order conversion"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "8. Write conversion without release/re-reserve gap"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiReliability "9. Insert outbox fact in the same local transaction"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "10. Write outbox beside authoritative state"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "11. COMMIT authoritative state and outbox atomically"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "12. Later publisher reads committed outbox"
    nexa.applicationApi.apiReliability -> nexa.applicationApi.apiIntegrations "13. Publish at-least-once after commit"
    autolayout lr
}

dynamic nexa.applicationApi "Nexa-Workflow-FulfillmentPickDispatchHandoff" "Fulfillment, pick and dispatch handoff: BC-05 retains Physical Allocation authority and BC-06 executes work" {
    warehouseOperator -> nexa.operationsMobile "1. Start authorized warehouse work"
    nexa.operationsMobile -> nexa.applicationApi.apiPresentation "2. Send operational command"
    nexa.applicationApi.apiPresentation -> nexa.applicationApi.apiApplication "3. Invoke fulfillment use case"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.targetInventoryAvailability "4. Resolve Physical Allocation contract"
    nexa.applicationApi.targetInventoryAvailability -> nexa.applicationApi.targetFulfillmentDelivery "5. Supply allocation to execution"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiPersistence "6. BEGIN local transaction and persist fulfillment/dispatch fact"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "7. Write scoped execution state"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiReliability "8. Insert outbox fact in the same local transaction"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "9. Write outbox beside authoritative state"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "10. COMMIT authoritative state and outbox atomically"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "11. Later publisher reads committed outbox"
    nexa.applicationApi.apiReliability -> nexa.applicationApi.apiIntegrations "12. Publish at-least-once after commit"
    autolayout lr
}

dynamic nexa.applicationApi "Nexa-Workflow-DeliveryPartialOutcomeContinuation" "Delivery partial outcome: failed attempt remains on the Delivery; partial result creates child continuation Delivery" {
    driverDeliveryOperator -> nexa.operationsMobile "1. Record Delivery attempt"
    nexa.operationsMobile -> nexa.applicationApi.apiPresentation "2. Send idempotent operational command"
    nexa.applicationApi.apiPresentation -> nexa.applicationApi.apiApplication "3. Invoke finalize-attempt use case"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.targetFulfillmentDelivery "4. Preserve immutable attempt outcome"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiPersistence "5. BEGIN local transaction and create idempotent parent-to-child continuation link"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "6. Write Delivery and child relationship"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiReliability "7. Insert partial/continuation outbox fact in the same local transaction"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "8. Write outbox beside authoritative state"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "9. COMMIT authoritative state and outbox atomically"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "10. Later publisher reads committed outbox"
    nexa.applicationApi.apiReliability -> nexa.applicationApi.apiIntegrations "11. Publish at-least-once after commit"
    autolayout lr
}

dynamic nexa.applicationApi "Nexa-Workflow-BuyerHandoffReceiptDiscrepancy" "Buyer handoff, receipt and discrepancy: verification is not receipt; Driver Outcome and Buyer Receipt remain immutable and separate" {
    b2bBuyer -> nexa.buyerMobile "1. Open authorized Delivery attention"
    nexa.buyerMobile -> nexa.applicationApi.apiPresentation "2. Send handoff/receipt command"
    nexa.applicationApi.apiPresentation -> nexa.applicationApi.apiApplication "3. Resolve bounded command"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.targetFulfillmentDelivery "4. Verify handoff and record Buyer Receipt/Discrepancy separately"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiPersistence "5. BEGIN local transaction and persist immutable Buyer Receipt/Discrepancy fact"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "6. Write scoped fact and evidence"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiReliability "7. Insert immutable fact outbox entry in the same local transaction"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "8. Write outbox beside authoritative state"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "9. COMMIT authoritative state and outbox atomically"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "10. Later publisher reads committed outbox"
    nexa.applicationApi.apiReliability -> nexa.applicationApi.apiIntegrations "11. Publish at-least-once after commit"
    autolayout lr
}

dynamic nexa.applicationApi "Nexa-Workflow-PaymentConfirmationReceivableApplication" "Payment confirmation and Receivable application: provider ACL, confirmed Payment and idempotent application preserve financial history" {
    b2bBuyer -> nexa.buyerPortal "1. Report payment intent/status"
    nexa.buyerPortal -> nexa.applicationApi.apiPresentation "2. Send authorized request"
    nexa.applicationApi.apiPresentation -> nexa.applicationApi.apiApplication "3. Invoke payment use case"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiIntegrations "4. Use provider ACL"
    nexa.applicationApi.apiIntegrations -> paymentProvider "5. Verify provider result"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.targetPaymentDocuments "6. Record confirmed Payment fact"
    nexa.applicationApi.targetPaymentDocuments -> nexa.applicationApi.targetCreditReceivables "7. Apply Payment to Receivable idempotently"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiPersistence "8. BEGIN local transaction and persist immutable financial result"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "9. Write scoped financial history"
    nexa.applicationApi.apiApplication -> nexa.applicationApi.apiReliability "10. Insert outbox fact in the same local transaction"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "11. Write outbox beside authoritative state"
    nexa.applicationApi.apiPersistence -> nexa.postgresqlDatabase "12. COMMIT authoritative state and outbox atomically"
    nexa.applicationApi.apiReliability -> nexa.postgresqlDatabase "13. Later publisher reads committed outbox"
    nexa.applicationApi.apiReliability -> nexa.applicationApi.apiIntegrations "14. Publish at-least-once after commit"
    autolayout lr
}
