codeunit 50130 QRcodeMgt
{
    internal procedure UpdateItemQRcode(var Item: Record Item)
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        InStrm: InStream;
        OutStrm: OutStream;
    begin
        if Item.QRcode.HasValue then
            exit;

        if Client.Get(GetQRcodeUrl(Item), Response) then begin
            if Response.IsSuccessStatusCode() then begin
                Response.Content().ReadAs(InStrm);
                Item.QRcode.CreateOutStream(OutStrm);
                CopyStream(OutStrm, InStrm);
                Item.Modify();
            end;
        end;
    end;

    local procedure GetQRcodeUrl(var Item: Record Item): Text;
    var
        UrlText: Label 'http://api.qrserver.com/v1/create-qr-code/?data=%1&size=200x200', Comment = '%1- ItemNo', Locked = true;
    begin
        exit(StrSubstNo(UrlText, Item."No."));
    end;
}
