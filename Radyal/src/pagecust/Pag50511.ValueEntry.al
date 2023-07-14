page 50511 "Movimientos Valor Editable"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Value Entry";
    ModifyAllowed = true;
    Editable = true;
    Permissions = tabledata "Value Entry" = rim;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number of the entry.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Item Ledger Entry No."; Rec."Item Ledger Entry No.")
                {
                    ToolTip = 'Specifies the number of the item ledger entry that this value entry is linked to.';
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                    ToolTip = 'Specifies the cost of invoiced items.';
                }
                field("Cost Amount (Expected)"; Rec."Cost Amount (Expected)")
                {
                    ToolTip = 'Specifies the expected cost of the items, which is calculated by multiplying the Cost per Unit by the Valued Quantity.';
                }
                field("Cost Posted to G/L"; Rec."Cost Posted to G/L")
                {
                    ToolTip = 'Specifies the amount that has been posted to the general ledger.';
                }
                field("Expected Cost Posted to G/L"; Rec."Expected Cost Posted to G/L")
                {
                    ToolTip = 'Specifies the expected cost amount that has been posted to the interim account in the general ledger.';
                }
                field("Cost Posted to G/L (ACY)"; Rec."Cost Posted to G/L (ACY)")
                {
                    ToolTip = 'Specifies the amount that has been posted to the general ledger if you post in an additional reporting currency.';
                    Visible = false;
                }
                field("Capacity Ledger Entry No."; Rec."Capacity Ledger Entry No.")
                {
                    ToolTip = 'Specifies the entry number of the item ledger entry that this value entry is linked to.';
                }
                field("Cost Amount (Non-Invtbl.)"; Rec."Cost Amount (Non-Invtbl.)")
                {
                    ToolTip = 'Specifies the non-inventoriable cost, that is an item charge assigned to an outbound entry.';
                }
                field("Cost Amount (Actual) (ACY)"; Rec."Cost Amount (Actual) (ACY)")
                {
                    ToolTip = 'Specifies the cost of the items that have been invoiced, if you post in an additional reporting currency.';
                }
                field("Cost Amount (Expected) (ACY)"; Rec."Cost Amount (Expected) (ACY)")
                {
                    ToolTip = 'Specifies the expected cost of the items in the additional reporting currency.';
                }
                field("Cost Amount (Non-Invtbl.)(ACY)"; Rec."Cost Amount (Non-Invtbl.)(ACY)")
                {
                    ToolTip = 'Specifies the non-inventoriable cost, that is an item charge assigned to an outbound entry in the additional reporting currency.';
                }
                field("Item Charge No."; Rec."Item Charge No.")
                {
                    ToolTip = 'Specifies the item charge number of the value entry.';
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                    ToolTip = 'Specifies how many units of the item are invoiced by the posting that the value entry line represents.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the code for the location of the item that the entry is linked to.';
                }
                field("Sales Amount (Actual)"; Rec."Sales Amount (Actual)")
                {
                    ToolTip = 'Specifies the price of the item for a sales entry.';
                }
                field("Sales Amount (Expected)"; Rec."Sales Amount (Expected)")
                {
                    ToolTip = 'Specifies the expected price of the item for a sales entry, which means that it has not been invoiced yet.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item that this value entry is linked to.';
                }
                field("Item Ledger Entry Type"; Rec."Item Ledger Entry Type")
                {
                    ToolTip = 'Specifies the type of item ledger entry that caused this value entry.';
                }
                field("Item Ledger Entry Quantity"; Rec."Item Ledger Entry Quantity")
                {
                    ToolTip = 'Specifies the average cost calculation.';
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}