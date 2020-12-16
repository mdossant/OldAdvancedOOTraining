 
 /*------------------------------------------------------------------------
    File        : CustomerBE
    Syntax      : 
    Author(s)   : mdossant
    Created     : Wed Dec 16 12:42:20 EST 2020
    Notes       : 
  ----------------------------------------------------------------------*/
  
@program FILE(name="CustomerBE.cls", module="AppServer").
@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
@progress.service.resource FILE(name="CustomerBE", URI="/CustomerBE", schemaName="dsCustomer", schemaFile="Exercises/AppServer/customerbe.i").

USING Progress.Lang.*.
USING OpenEdge.BusinessLogic.BusinessEntity.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Exercise_04.CustomerBE INHERITS BusinessEntity:
    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    
    {"Exercise_04/customerbe.i"}
    
    DEFINE DATA-SOURCE srcCustomer FOR sports.Customer.
    
    
    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC CustomerBE():
        
        DEFINE VARIABLE hDataSourceArray AS HANDLE NO-UNDO EXTENT 1.
        DEFINE VARIABLE cSkipListArray AS CHARACTER NO-UNDO EXTENT 1.
        
        SUPER (DATASET dsCustomer:HANDLE).
        
        /* Data Source for each table in dataset. Should be in table order as defined 
            in DataSet */     
         hDataSourceArray[1] =  DATA-SOURCE srcCustomer:HANDLE.
         
                  
         /* Skip-list entry for each table in dataset. Should be in temp-table order 
           as defined in DataSet */
        /* Each skip-list entry is a comma-separated list of field names, to be
            ignored in create stmt */
             
         cSkipListArray[1] = "".
         
         
         THIS-OBJECT:ProDataSource = hDataSourceArray.
        THIS-OBJECT:SkipList = cSkipListArray.
                 
    END CONSTRUCTOR.
        
    /*------------------------------------------------------------------------------
            Purpose:  Get one or more records, based on a filter string                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="read", URI="?filter=~{filter~}", alias="", mediaType="application/json"). 
    METHOD PUBLIC VOID ReadCustomerBE(
            INPUT filter AS CHARACTER, 
            OUTPUT DATASET dsCustomer):
        
        SUPER:ReadData(filter).
              
    END METHOD.
      
    /*------------------------------------------------------------------------------
            Purpose: Create one or more new records                                                               
            Notes:                                                                        
    ------------------------------------------------------------------------------*/  
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="create", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID CreateCustomerBE(INPUT-OUTPUT DATASET dsCustomer):            
               
        SUPER:CreateData(DATASET dsCustomer BY-REFERENCE).        
    END METHOD.    
    
    /*------------------------------------------------------------------------------
            Purpose:  Update one or more records                                                                  
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="update", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID UpdateCustomerBE(INPUT-OUTPUT DATASET dsCustomer):            
    
        SUPER:UpdateData(DATASET dsCustomer BY-REFERENCE).          
    END METHOD.
    
    /*------------------------------------------------------------------------------
            Purpose:    Delete a record                                                               
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="delete", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID DeleteCustomerBE(INPUT-OUTPUT DATASET dsCustomer):                    
    
        SUPER:DeleteData(DATASET dsCustomer BY-REFERENCE).
    END METHOD.
     
    
END CLASS.
