page 50505 DetallePartes
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Detalle Partes Administrador';
    SourceTable = "Time Sheet Detail";
    InsertAllowed = false;
    ModifyAllowed = false;
    Editable = false;
    RefreshOnActivate = true;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Time Sheet No."; Rec."Time Sheet No.")
                {
                    ToolTip = 'Specifies the value of the Time Sheet No. field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ToolTip = 'Specifies the value of the Resource No. field.';
                    Visible = TimeSheetV2Enabled;
                }

                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                    Visible = TimeSheetV2Enabled;
                }


                field("Posted Quantity"; Rec."Posted Quantity")
                {
                    ToolTip = 'Specifies the value of the Posted Quantity field.';
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                }


                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }

                field("Time Sheet Line No."; Rec."Time Sheet Line No.")
                {
                    ToolTip = 'Specifies the value of the Time Sheet Line No. field.';
                }



            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("&Edit Time Sheet")
            {
                ApplicationArea = Jobs;
                Caption = '&Review Time Sheet';
                Image = OpenJournal;
                ShortCutKey = 'Return';
                ToolTip = 'Open the time sheet to approve its details. This requires that you''re the time sheet owner, administrator, or approver.';
                Visible = not TimeSheetV2Enabled;

                trigger OnAction()
                begin
                    ReviewTimeSheet();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then
            if UserSetup."Time Sheet Admin." = true then begin
                TimeSheetV2Enabled := TimeSheetMgt.TimeSheetV2Enabled();
                TimeSheetAdminActionsVisible := true;
                if UserSetup.Get(UserId) then
                    CurrPage.Editable := UserSetup."Time Sheet Admin.";
                if TimeSheetV2Enabled then
                    TimeSheetAdminActionsVisible := UserSetup."Time Sheet Admin.";

                //revisar
                TimeSheetMgt.FilterTimeSheets(TimeSheetHeader, TimeSheetHeader.FieldNo("Approver User ID"));
            end else begin
                Error('No tiene permisos de administrador');
            end;

    end;

    local procedure ReviewTimeSheet()
    var
        TimeSheetLine: Record "Time Sheet Line";
        TimeSheetCard: Page "Time Sheet Card";
        TimeSheetLineDetail: Record "Time Sheet Detail";
    begin
        if TimeSheetV2Enabled then begin
            TimeSheetCard.SetManagerTimeSheetMode();
            TimeSheetCard.SetTableView(Rec);
            TimeSheetCard.SetRecord(Rec);
            TimeSheetCard.Run();
        end else begin
            //    TimeSheetMgt.SetTimeSheetNo("No.", TimeSheetLine);
            Page.Run(Page::"Manager Time Sheet", TimeSheetLine);
        end;
    end;

    var
        UserSetup: Record "User Setup";
        TimeSheetV2Enabled: Boolean;
        TimeSheetAdminActionsVisible: Boolean;
        TimeSheetMgt: Codeunit "Time Sheet Management";
        TimeSheetHeader: Record "Time Sheet Header";
}