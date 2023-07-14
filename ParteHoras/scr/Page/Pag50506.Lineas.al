page 50506 "Lineas Detalles"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Time Sheet Line";
    Caption = 'Lineas Partes Administrador';
    Editable = true;
    InsertAllowed = false;
    DelayedInsert = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Time Sheet No."; Rec."Time Sheet No.")
                {
                    ToolTip = 'Specifies the value of the Time Sheet No. field.';
                }
                field("Time Sheet Starting Date"; Rec."Time Sheet Starting Date")
                {
                    ToolTip = 'Specifies the value of the Time Sheet Starting Date field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the time sheet line.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the number for the job that is associated with the time sheet line.';
                }

                field("Job Task No."; Rec."Job Task No.")
                {
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ToolTip = 'Specifies the value of the Approver ID field.';
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    ToolTip = 'Specifies which work type the resource applies to. Prices are updated based on this entry.';
                }
                field("Recurso No."; "Recurso No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the resource for the time sheet.';
                    Editable = false;
                }
                field("Nombre Recurso"; "Nombre Recurso")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the name of the resource for the time sheet.';
                    Editable = false;

                }


                field(Field1; CellData[1])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[1];
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(1);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field2; CellData[2])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[2];
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(2);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field3; CellData[3])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[3];
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(3);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field4; CellData[4])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[4];
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(4);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field5; CellData[5])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[5];
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(5);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field6; CellData[6])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[6];
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(6);
                        CellDataOnAfterValidate();
                    end;
                }
                field(Field7; CellData[7])
                {
                    ApplicationArea = Jobs;
                    BlankZero = true;
                    CaptionClass = '3,' + ColumnCaption[7];
                    DecimalPlaces = 0 : 2;
                    Editable = AllowEdit;
                    Width = 6;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        ValidateQuantity(7);
                        CellDataOnAfterValidate();
                    end;
                }
                field("Total Quantity"; Rec."Total Quantity")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Total';
                    DrillDown = false;
                    ToolTip = 'Specifies the total number of hours that have been entered on a time sheet.';
                    Visible = false;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies information about the status of a time sheet line.';
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
            action(Reopen)
            {
                ApplicationArea = Jobs;
                Caption = 'Re&open';
                Image = ReOpen;
                ToolTip = 'Reopen the time sheet to change it.';

                trigger OnAction()
                begin
                    ReopenLine();
                end;
            }
            action("&Edit Time Sheet")
            {
                ApplicationArea = Jobs;
                Caption = '&Review Time Sheet';
                Image = OpenJournal;
                ShortCutKey = 'Return';
                ToolTip = 'Open the time sheet to approve its details. This requires that you''re the time sheet owner, administrator, or approver.';
                Visible = not TimeSheetV2Enabled;
                ObsoleteReason = 'Removed as part of old Time Sheet UI.';
                ObsoleteState = Pending;
                ObsoleteTag = '22.0';

                trigger OnAction()
                begin
                    ReviewTimeSheet();
                end;
            }

            action(Approve)
            {
                ApplicationArea = Jobs;
                Caption = '&Approve';
                Image = ReleaseDoc;
                ShortCutKey = 'Ctrl+F9';
                ToolTip = 'Approve the lines on the time sheet. Choose All to approve all lines. Choose Selected to approve only selected lines.';

                trigger OnAction()
                begin
                    ApproveLines();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin

        if UserSetup.Get(UserId) then
            if NOT UserSetup."Time Sheet Admin." then begin
                Error('debe ser Administrador de Partes.');
            end else begin
                /*rec.FilterGroup(2);

                rec.SetRange("Approver ID", UserId);

                rec.FilterGroup(0);


*/
                TimeSheetMgt.FilterAllTimeSheetLines(rec, 2);
                //rec.FindFirst();
                CurrTimeSheetNo := rec."Time Sheet No.";
                if TimeSheetHeader.Get(CurrTimeSheetNo) then;
                //UpdateControls();
                AllowEdit := true;


            end;
    end;

    trigger OnAfterGetRecord()
    var
        RRecurso: Record Resource;
    begin
        if TimeSheetHeader.get(rec."Time Sheet No.") then begin
            "Recurso No." := TimeSheetHeader."Resource No.";
            if RRecurso.Get(TimeSheetHeader."Resource No.") then
                "Nombre Recurso" := RRecurso.Name;
            UpdateControls();
            AfterGetCurrentRecord();
        end;

    end;

    trigger OnAfterGetCurrRecord()
    var
        RRecurso: Record Resource;
    begin
        if TimeSheetHeader.get(rec."Time Sheet No.") then begin
            "Recurso No." := TimeSheetHeader."Resource No.";
            if RRecurso.Get(TimeSheetHeader."Resource No.") then
                "Nombre Recurso" := RRecurso.Name;
            UpdateControls();
            AfterGetCurrentRecord();
        end;
        //   UpdateControls();
    end;

    procedure CellDataOnAfterValidate()
    begin
        // UpdateFactBoxes();
        rec.CalcFields("Total Quantity");
    end;

    /* local procedure UpdateFactBoxes()
     begin
         CurrPage.ActualSchedSummaryFactBox.PAGE.UpdateData(TimeSheetHeader);
         CurrPage.TimeSheetStatusFactBox.PAGE.UpdateData(TimeSheetHeader);
         if "Line No." = 0 then
             CurrPage.ActivityDetailsFactBox.PAGE.SetEmptyLine();
     end;
 */
    local procedure FindTimeSheet(Which: Option)
    begin
        //   CurrTimeSheetNo := TimeSheetMgt.FindTimeSheet(TimeSheetHeader, Which);
        //  TimeSheetMgt.FilterAllTimeSheetLines(TimeSheetLine, 2);
        TimeSheetMgt.SetTimeSheetNo(CurrTimeSheetNo, Rec);
        TimeSheetHeader.Get(CurrTimeSheetNo);
        UpdateControls();
    end;

    local procedure UpdateControls()
    begin
        SetColumns();
        // UpdateFactBoxes();
        CurrPage.Update(false);
    end;

    procedure SetColumns()
    var
        Calendar: Record Date;
    begin
        Clear(ColumnCaption);
        Clear(ColumnRecords);
        Clear(Calendar);
        Clear(NoOfColumns);


        GetTimeSheetHeader();
        Calendar.SetRange("Period Type", Calendar."Period Type"::Date);
        Calendar.SetRange("Period Start", TimeSheetHeader."Starting Date", TimeSheetHeader."Ending Date");
        if Calendar.FindSet() then
            repeat
                NoOfColumns += 1;
                ColumnRecords[NoOfColumns]."Period Start" := Calendar."Period Start";
                ColumnCaption[NoOfColumns] := TimeSheetMgt.FormatDate(Calendar."Period Start", 1);
            //     ValidateQuantity(NoOfColumns);
            until Calendar.Next() = 0;

    end;

    local procedure GetTimeSheetHeader()
    begin
        // TimeSheetHeader.Get(CurrTimeSheetNo);
        TimeSheetHeader.Get(rec."Time Sheet No.");

    end;

    local procedure AfterGetCurrentRecord()
    var
        i: Integer;
    begin
        i := 0;
        while i < NoOfColumns do begin
            i := i + 1;
            if (rec."Line No." <> 0) and TimeSheetDetail.Get(
                 rec."Time Sheet No.",
                 rec."Line No.",
                 ColumnRecords[i]."Period Start")
            then
                CellData[i] := TimeSheetDetail.Quantity
            else
                CellData[i] := 0;
        end;

    end;

    local procedure ValidateQuantity(ColumnNo: Integer)
    begin
        if (CellData[ColumnNo] <> 0) and (rec.Type = rec.Type::" ") then
            Error(Text001);

        if TimeSheetDetail.Get(
             rec."Time Sheet No.",
             rec."Line No.",
             ColumnRecords[ColumnNo]."Period Start")
        then begin
            if CellData[ColumnNo] <> TimeSheetDetail.Quantity then
                //     TestTimeSheetLineStatus();

                if CellData[ColumnNo] = 0 then
                    TimeSheetDetail.Delete()
                else begin
                    TimeSheetDetail.Quantity := CellData[ColumnNo];
                    TimeSheetDetail.Modify(true);
                end;
        end else
            if CellData[ColumnNo] <> 0 then begin
                //  TestTimeSheetLineStatus();

                TimeSheetDetail.Init();
                TimeSheetDetail.CopyFromTimeSheetLine(Rec);
                TimeSheetDetail.Date := ColumnRecords[ColumnNo]."Period Start";
                TimeSheetDetail.Quantity := CellData[ColumnNo];
                TimeSheetDetail.Insert(true);
            end;
    end;


    local procedure TestTimeSheetLineStatus()
    var
        TimeSheetLine: Record "Time Sheet Line";
    begin
        TimeSheetLine.Get(Rec."Time Sheet No.", rec."Line No.");
        TimeSheetLine.TestStatus();
    end;


    procedure ReopenLine()
    var
        ActionType: Option Approve,Reopen,Reject;
        "Action": Option "Approve Selected","Approve All","Reopen Selected","Reopen All","Reject Selected","Reject All";
        TimeSheetLine: Record "Time Sheet Line";
    begin
        if TimeSheetLine.Get(Rec."Time Sheet No.", Rec."Line No.") then begin
            case ShowDialog(ActionType::Reopen) of
                1:
                    Process(Action::"Reopen All");
                2:
                    Process(Action::"Reopen Selected");
            end;
        end;

    end;


    procedure ApproveLines()
    var
        "Action": Option "Approve Selected","Approve All","Reopen Selected","Reopen All","Reject Selected","Reject All";
        ActionType: Option Approve,Reopen,Reject;
        TimeSheetLine: Record "Time Sheet Line";
    begin
        if TimeSheetLine.Get(Rec."Time Sheet No.", Rec."Line No.") then begin
            case ShowDialog(ActionType::Approve) of
                1:
                    Process(Action::"Approve All");
                2:
                    Process(Action::"Approve Selected");
            end;
        end;
    end;

    procedure Process("Action": Option "Approve Selected","Approve All","Reopen Selected","Reopen All","Reject Selected","Reject All")
    var
        TimeSheetLine: Record "Time Sheet Line";
        TempTimeSheetLine: Record "Time Sheet Line" temporary;
        ActionType: Option Approve,Reopen,Reject;
    begin
        CurrPage.SaveRecord();
        case Action of
            Action::"Approve All",
          Action::"Reject All":
                FilterAllLines(TimeSheetLine, ActionType::Approve);
            Action::"Reopen All":
                FilterAllLines(TimeSheetLine, ActionType::Reopen);
            else
                CurrPage.SetSelectionFilter(TimeSheetLine);
        end;
        //   OnProcessOnAfterTimeSheetLinesFiltered(TimeSheetLine, Action);
        TimeSheetMgt.CopyFilteredTimeSheetLinesToBuffer(TimeSheetLine, TempTimeSheetLine);
        if TimeSheetLine.FindSet() then
            repeat
                case Action of
                    Action::"Approve Selected",
                  Action::"Approve All":
                        TimeSheetApprovalMgt.Approve(TimeSheetLine);
                    Action::"Reopen Selected",
                  Action::"Reopen All":
                        TimeSheetApprovalMgt.ReopenApproved(TimeSheetLine);
                    Action::"Reject Selected",
                  Action::"Reject All":
                        TimeSheetApprovalMgt.Reject(TimeSheetLine);
                end;
            until TimeSheetLine.Next() = 0;
        //    OnAfterProcess(TempTimeSheetLine, Action);
        CurrPage.Update(false);
    end;

    procedure FilterAllLines(var TimeSheetLine: Record "Time Sheet Line"; ActionType: Option Approve,Reopen,Reject)
    begin
        TimeSheetLine.SetRange("Time Sheet No.", CurrTimeSheetNo);
        TimeSheetLine.CopyFilters(Rec);
        TimeSheetLine.FilterGroup(2);
        TimeSheetLine.SetFilter(Type, '<>%1', TimeSheetLine.Type::" ");
        TimeSheetLine.FilterGroup(0);
        case ActionType of
            ActionType::Approve,
          ActionType::Reject:
                TimeSheetLine.SetRange(Status, TimeSheetLine.Status::Submitted);
            ActionType::Reopen:
                TimeSheetLine.SetRange(Status, TimeSheetLine.Status::Approved);
        end;

        //    OnAfterFilterAllLines(TimeSheetLine, ActionType);
    end;

    procedure ReviewTimeSheet()
    var
        TimeSheetLine: Record "Time Sheet Line";
        TimeSheetCard: Page "Time Sheet Card";
        TimeSheetHeader: Record "Time Sheet Header";
    begin
        if not TimeSheetV2Enabled then begin

            TimeSheetMgt.SetTimeSheetNo(rec."Time Sheet No.", TimeSheetLine);
            TimeSheetHeader.Get(rec."Time Sheet No.");
            Page.Run(Page::"Time Sheet Card", TimeSheetHeader);
            exit;
        end;
        TimeSheetCard.SetManagerTimeSheetMode();
        TimeSheetCard.SetTableView(Rec);
        TimeSheetCard.SetRecord(Rec);
        TimeSheetCard.Run();
    end;

    local procedure ShowDialog(ActionType: Option Approve,Reopen,Reject): Integer
    begin
        exit(StrMenu(GetDialogText(ActionType), 1, TimeSheetApprovalMgt.GetManagerTimeSheetDialogInstruction(ActionType)));
    end;

    procedure GetDialogText(ActionType: Option Approve,Reopen,Reject): Text[100]
    var
        TimeSheetLine: Record "Time Sheet Line";
    begin
        FilterAllLines(TimeSheetLine, ActionType);
        exit(TimeSheetApprovalMgt.GetManagerTimeSheetDialogText(ActionType, TimeSheetLine.Count));
    end;

    var
        TimeSheetV2Enabled: Boolean;
        UserSetup: Record "User Setup";
        TimeSheetHeader: Record "Time Sheet Header";
        TimeSheetLine: Record "Time Sheet Line";
        TimeSheetDetail: Record "Time Sheet Detail";
        ColumnRecords: array[32] of Record Date;
        TimeSheetMgt: Codeunit "Time Sheet Management";
        TimeSheetApprovalMgt: Codeunit "Time Sheet Approval Management";
        NoOfColumns: Integer;
        CellData: array[32] of Decimal;
        ColumnCaption: array[32] of Text[1024];
        CurrTimeSheetNo: Code[20];
        SetWanted: Option Previous,Next;
        Text001: Label 'The type of time sheet line cannot be empty.';
        AllowEdit: Boolean;
        DimensionCaptionTok: Label 'Dimensions';
        "Recurso No.": Code[20];
        "Nombre Recurso": Text;


}