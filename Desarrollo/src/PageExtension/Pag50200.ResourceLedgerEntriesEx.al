pageextension 50200 "Resource Ledger Entries" extends "Resource Ledger Entries" //202
{
    layout
    {
        addafter("Resource No.")
        {
            field(Nombre; Nombre)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the name';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnAfterGetRecord()
    begin
        clear(Nombre);
        if recurso.get(rec."Resource No.") then begin
            Nombre := Recurso.name;
        end else begin
            clear(nombre);
        end;
    end;

    var
        myInt: Integer;
        Nombre: Text;
        Recurso: record resource;
}