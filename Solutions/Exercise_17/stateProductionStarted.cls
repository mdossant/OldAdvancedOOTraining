/*------------------------------------------------------------------------
  File        : stateProductionStarted
  Purpose     : 
  Syntax      : 
  Description : 
  Author(s)   :
  Created     :
  Notes       : 
----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Exercise_17.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Exercise_17.stateProductionStarted INHERITS State: 

    METHOD PUBLIC VOID factoryCompletesCar(objOrderStateMachine as OrderStateMachine):
        objOrderStateMachine:setState(NEW stateProductionCompleted()).
    END METHOD.

END CLASS.