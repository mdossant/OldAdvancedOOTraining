/*------------------------------------------------------------------------
  File        : InvoiceAdapter
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

CLASS Exercise_09.InvoiceAdapter: 
    
    DEFINE PROTECTED PROPERTY DigitalFactory AS DigitalFactory NO-UNDO 
        GET.
        SET. 

    CONSTRUCTOR PUBLIC InvoiceAdapter (  ):
        DigitalFactory = NEW DigitalFactory().
    END CONSTRUCTOR.

    METHOD PUBLIC VOID createInvoice(INPUT ipiInvoiceNumber  AS INTEGER, 
        INPUT ipiCustomerNumber AS INTEGER, 
        INPUT ipiInvoiceType    AS INTEGER):
        DigitalFactory:generateDigitalInvoice(ipiInvoiceNumber,ipiCustomerNumber).
    END METHOD. 

END CLASS.