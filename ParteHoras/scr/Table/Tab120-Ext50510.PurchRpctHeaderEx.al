tableextension 50510 PurchRpctHeadderEx extends "Purch. Rcpt. Header" //120
{
    fields
    {
        field(50100; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Purch. Rcpt. Line"."Item Charge Base Amount" WHERE("Document No." = FIELD("No.")));
            Caption = 'Amount';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}