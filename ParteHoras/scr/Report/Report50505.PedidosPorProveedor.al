report 50505 "Pedidos Por Proveedores"
{
    DefaultLayout = RDLC;
    RDLCLayout = './PedidosPorProveedores.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Pedidos por Proveedor';
    PreviewMode = PrintLayout;

    /*
     DefaultLayout = RDLC;
        RDLCLayout = './AgedAccountsReceivableV21.rdlc';
        ApplicationArea = Basic, Suite;
        Caption = 'Aged Accounts Receivable V21';
        PreviewMode = PrintLayout;
        UsageCategory = ReportsAndAnalysis;
        DataAccessIntent = ReadOnly;
    */
    dataset
    {
        dataitem(AlbaranCompra; "Purch. Rcpt. Header")
        {
            DataItemTableView = where("Order No." = filter(<> ''));

            RequestFilterFields = "Order Date", "Buy-from Vendor No.", "Posting Date";

            column(No_AlbaranCompra; "No.")
            {
            }

            column(No_AlbaranCompraCaption; AlbaranCompra.FieldCaption("No."))
            {
            }

            column(BuyfromVendorNo_AlbaranCompra; "Buy-from Vendor No.")
            {

            }

            column(BuyfromVendorNo_AlbaranCompraCaption; AlbaranCompra.FieldCaption("Buy-from Vendor No."))
            {

            }
            column(BuyfromVendorName_AlbaranCompra; "Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName_AlbaranCompraCaption; AlbaranCompra.FieldCaption("Buy-from Vendor Name"))
            {
            }
            column(OrderDate_AlbaranCompra; "Order Date")
            {
            }
            column(OrderDate_AlbaranCompraCaption; AlbaranCompra.FieldCaption("Order Date"))
            {
            }
            column(PostingDate_AlbaranCompra; "Posting Date")
            {
            }
            column(PostingDate_AlbaranCompraCaption; AlbaranCompra.FieldCaption("Posting Date"))
            {
            }

            column(OrderNo_AlbaranCompra; "Order No.")
            {
            }
            column(OrderNo_AlbaranCompraCaption; AlbaranCompra.FieldCaption("Order No."))
            {
            }
            column(total; total) { }

            trigger OnAfterGetRecord()
            begin
                CalculoAlbaran(AlbaranCompra);
            end;
        }

        /*    dataitem(PedidoCompra; "Purchase Header")
            {
                //  DataItemLinkReference = "Buy-from Vendor No." = field("Buy-from Vendor No.");
                //  DataItemLink = "Buy-from Vendor No." = field("Buy-from Vendor No.");
                DataItemTableView = where("Document Type" = filter(order));

                column(No_PedidoCompra; "No.")
                {
                }
                column(No_PedidoCompraCaption; PedidoCompra.FieldCaption("No."))
                {
                }
                column(BuyfromVendorNo_PedidoCompra; "Buy-from Vendor No.")
                {
                }
                column(BuyfromVendorNo_PedidoCompraCaption; PedidoCompra.FieldCaption("Buy-from Vendor No."))
                {
                }
                column(BuyfromVendorName_PedidoCompra; "Buy-from Vendor Name")
                {
                }
                column(BuyfromVendorName_PedidoCompraCaption; PedidoCompra.FieldCaption("Buy-from Vendor Name"))
                {
                }
                column(OrderDate_PedidoCompra; "Order Date")
                {
                }
                column(OrderDate_PedidoCompraCaption; PedidoCompra.FieldCaption("Order Date"))
                {
                }
                column(PostingDate_PedidoCompra; "Posting Date")
                {
                }
                column(PostingDate_PedidoCompraCaption; PedidoCompra.FieldCaption("Posting Date"))
                {
                }
                column(Amount_PedidoCompraCaption; PedidoCompra.FieldCaption(Amount))
                {
                }
                column(Amount_PedidoCompra; Amount)
                {
                }

                trigger OnPreDataItem()

                begin
                    PedidoCompra.CalcFields(PedidoCompra.Amount);
                end;


            }
            */

    }



    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    procedure CalculoAlbaran(pAlbaran: Record "Purch. Rcpt. Header")
    begin
        total := 0;
        PurchShippLine.SetRange("Document No.", pAlbaran."No.");
        if PurchShippLine.FindFirst() then begin
            repeat
                total := total + (PurchShippLine.Quantity * PurchShippLine."Unit Cost (LCY)");

            until PurchShippLine.Next() = 0;
        end;
    end;

    var
        myInt: Integer;
        PurchShippLine: Record "Purch. Rcpt. Line";
        PurchShippHeader: Record "Purch. Rcpt. Header";
        total: Decimal;
        PedidoPorProveedorLbl: Label 'Pedidos por Proveedor';
        CompanyInformacion: Record "Company Information";
}