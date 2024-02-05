report 50130 LabelItemQRcode
{
    ApplicationArea = All;
    Caption = 'Label Item QR-code';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.\src\report\layout\LabelItemQRcode.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(QRcode; QRcode)
            {
            }
            column(BaseUnitofMeasure; "Base Unit of Measure")
            {
            }
            column(UnitPrice; "Unit Price")
            {
            }

            trigger OnAfterGetRecord()
            begin
                QRcodeMgt.UpdateItemQRcode(Item);
            end;
        }

    }
    requestpage
    {
        layout
        {
            area(content)
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
            }
        }
    }
    var
        QRcodeMgt: Codeunit QRcodeMgt;
}
