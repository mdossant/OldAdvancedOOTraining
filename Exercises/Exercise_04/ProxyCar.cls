/*------------------------------------------------------------------------
  File        : ProxyCar
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

CLASS Exercise_04.ProxyCar: 

    DEFINE PRIVATE STATIC PROPERTY hServer AS HANDLE NO-UNDO
        GET.
        SET.

    METHOD PUBLIC DECIMAL calculateRemainingMileage ():
        
        DEFINE VARIABLE mileage AS DECIMAL NO-UNDO.
        
        IF NOT VALID-HANDLE(hServer) THEN
        DO:
            CREATE SERVER hServer.
            hServer:CONNECT("-sessionModel Session-free -URL http://localhost:8810/oeabl/apsv").
        END.
        RUN Exercise_04/StartCar.p ON SERVER hServer (OUTPUT mileage).

/*          RUN Exercise_04/StartCar.p (OUTPUT mileage).*/
            
        RETURN mileage.
        
    END METHOD.

END CLASS.