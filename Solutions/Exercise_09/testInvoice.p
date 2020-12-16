/*------------------------------------------------------------------------
    File        : testInvoice
    Purpose     : 
    Syntax      :
    Description : 
    Author(s)   : 
    Created     :
    Notes       :
  ----------------------------------------------------------------------*/

USING Exercise_09.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

DEFINE VARIABLE objInvoicer AS Invoicer NO-UNDO.

objInvoicer = NEW Invoicer().
objInvoicer:createInvoice(20170001,42,1).