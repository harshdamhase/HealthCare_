codeunit 50102 "Post Pharmacy Mgt"
{
    procedure PostPharmacy(var PharmacyHeader: Record "Pharmacy Header")
    var
        PharmacyLine: Record "Pharmacy Line Tab2";
    begin
        if PharmacyHeader.Status = PharmacyHeader.Status::Posted then
            Error('This Pharmacy document has already been posted.');

        PharmacyLine.SetRange("Pharmacy Issue No", PharmacyHeader."Pharmacy Issue No");

        if not PharmacyLine.FindFirst() then
            Error('There are no pharmacy lines to post.');

        repeat
            if PharmacyLine.Quantity <= 0 then
                Error(
                  'Quantity must be greater than zero for Medicine %1.',
                  PharmacyLine."Medicine No");


        until PharmacyLine.Next() = 0;

        // PharmacyHeader.Status := PharmacyHeader.Status::Posted;
        // PharmacyHeader."Posting Date" := Today;
        // PharmacyHeader.Modify(true);

        Message('Pharmacy document %1 has been posted successfully.',
            PharmacyHeader."Pharmacy Issue No");
    end;
}