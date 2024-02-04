pageextension 50130 ItemCardExt extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(QRcode; Rec.QRcode)
            {
                ApplicationArea = All;
            }
            field(GenerateQR; GenerateQR)
            {
                ApplicationArea = All;
                ShowCaption = false;
                trigger OnDrillDown()
                var
                    QRcodeMgt: Codeunit QRcodeMgt;
                begin
                    QRcodeMgt.UpdateItemQRcode(Rec);
                end;
            }
        }
    }
    var
        GenerateQR: Label 'Generate QR-Code';
}
