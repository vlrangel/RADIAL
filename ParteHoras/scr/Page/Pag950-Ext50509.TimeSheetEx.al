pageextension 50509 TimeSheetEx extends "Time Sheet"//950
{
    layout
    {
        // Add changes to page layout here
        modify("Job No.")
        {
            Visible = true;
        }
        modify("Job Task No.")
        {
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}