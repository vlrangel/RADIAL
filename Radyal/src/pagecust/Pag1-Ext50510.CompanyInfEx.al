pageextension 50510 CompanyInfEx extends "Company Information" //1
{
    layout
    {
        addafter(Picture)
        {

            field("Texto Pie"; Rec."Texto Pie")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Texto Pie field.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}