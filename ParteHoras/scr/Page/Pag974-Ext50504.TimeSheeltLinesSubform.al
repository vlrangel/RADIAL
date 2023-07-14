pageextension 50504 "TimeSheetLinesSubform" extends "Time Sheet Lines Subform" //974
{
    layout
    {
        addafter("Job No.")
        {

            field("Descripcion Proyecto"; "Descripcion Proyecto")
            {
                ApplicationArea = All;

            }
        }


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

    trigger OnAfterGetRecord()
    begin
        Clear("Descripcion Proyecto");
        if job.Get(Rec."Job No.") then begin
            "Descripcion Proyecto" := job.Description;

        end else begin
            Clear("Descripcion Proyecto");
        end;
    end;

    var
        myInt: Integer;
        "Descripcion Proyecto": Text;
        job: Record Job;
}