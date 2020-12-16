 
/*------------------------------------------------------------------------
   File        : DataAccessCar
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : mdossant
   Created     : Wed Dec 16 11:14:31 EST 2020
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Exercise_04.DataAccessCar: 
    
    METHOD PUBLIC DECIMAL getMileage ():
        FIND FIRST Customer NO-LOCK.
        RETURN Customer.CreditLimit / 1000.
    END METHOD.        

    METHOD PUBLIC VOID saveMileage (newcreditlimit AS DECIMAL):
        FIND FIRST customer EXCLUSIVE-LOCK.
        Customer.CreditLimit = newcreditlimit.
    END METHOD.
END CLASS.