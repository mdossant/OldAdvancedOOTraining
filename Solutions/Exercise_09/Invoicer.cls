/*------------------------------------------------------------------------
  File        : Invoicer
  Purpose     : 
  Syntax      : 
  Description : 
  Author(s)   :
  Created     :
  Notes       : 
----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Exercise_09.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Exercise_09.Invoicer: 
    
    DEFINE PROTECTED PROPERTY InvoiceAdapter AS InvoiceAdapter NO-UNDO 
        GET.
        SET. 

    CONSTRUCTOR PUBLIC Invoicer (  ):
        InvoiceAdapter = NEW InvoiceAdapter().
    END CONSTRUCTOR.

    METHOD PUBLIC VOID createInvoice(INPUT ipiInvoiceNumber  AS INTEGER, 
        INPUT ipiCustomerNumber AS INTEGER, 
        INPUT ipiInvoiceType    AS INTEGER):
        
        CASE ipiInvoiceType:
            WHEN 1 THEN /* default invoice */
                MESSAGE "Invoice " STRING(ipiInvoiceNumber) + " of type " STRING(ipiInvoiceType) " created for customer " STRING(ipiCustomerNumber)
                    VIEW-AS ALERT-BOX.
            WHEN 2 THEN /* use digital factory */
                InvoiceAdapter:createInvoice(ipiInvoiceNumber,ipiCustomerNumber,ipiInvoiceType).
        END CASE.

    END METHOD.

END CLASS.