/*------------------------------------------------------------------------
    File        : StartCar
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : 
    Created     :
    Notes       :
  ----------------------------------------------------------------------*/

USING Exercise_04.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

    {"Exercise_04/customerbe.i"}

def output param mileage as de init 123000.

def var theAccess as CustomerBE no-undo.

theAccess = new CustomerBE().

theAccess:ReadCustomerBE("Custnum < 100 and name matches '*sport*'", dataset dsCustomer).

for each ttCustomer.
//message ttCustomer.Name view-as alert-box.
name = name + " UPDATEDX".
end.

theAccess:UpdateCustomerBE(dataset dsCustomer).

//theAccess:saveMileage(123500).
