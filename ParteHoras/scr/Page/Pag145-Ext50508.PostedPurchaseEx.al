pageextension 50508 PostedPurchaseEx extends "Posted Purchase Receipt" //145
{
    layout
    {
        addafter("Order No.")
        {

            field(Amount; Rec.Amount)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Amount field.';
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