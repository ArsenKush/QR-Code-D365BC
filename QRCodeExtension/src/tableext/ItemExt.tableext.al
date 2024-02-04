tableextension 50130 ItemExt extends Item
{
    fields
    {
        field(50100; QRcode; Blob)
        {
            Caption = 'QR code';
            DataClassification = CustomerContent;
            Subtype = Bitmap;
        }
    }
}
