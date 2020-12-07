/*------------------------------------------------------------------------
  File        : DigitalFactory
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

CLASS Exercise_09.DigitalFactory: 

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID generateDigitalInvoice(INPUT ipiInvoiceNumber  AS INTEGER, 
        INPUT ipiCustomerNumber AS INTEGER):
        
        MESSAGE "Digital Invoice " STRING(ipiInvoiceNumber) + " created for customer " STRING(ipiCustomerNumber)
            VIEW-AS ALERT-BOX.

    END METHOD.

END CLASS.