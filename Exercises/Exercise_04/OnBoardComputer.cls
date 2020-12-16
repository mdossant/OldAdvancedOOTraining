/*------------------------------------------------------------------------
  File        : OnBoardComputer
  Purpose     : 
  Syntax      : 
  Description : 
  Author(s)   :
  Created     :
  Notes       : 
----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Exercise_04.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Exercise_04.OnBoardComputer ABSTRACT: 
    
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC INTEGER calculateFuelConsumption(  ):
        
        DEFINE VARIABLE result AS INTEGER NO-UNDO.

        RETURN 14.
        
    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC decimal calculateRemainingMileage(  ):

        DEFINE VARIABLE mileage AS decimal NO-UNDO.
        DEFINE VARIABLE objProxyCar AS ProxyCar NO-UNDO.
        objProxyCar = NEW ProxyCar().
        mileage = objProxyCar:calculateRemainingMileage().
        RETURN mileage.
        
    END METHOD.
    

END CLASS.