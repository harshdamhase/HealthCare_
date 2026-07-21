codeunit 50104 "Posted Pharmacy Header"
{
    procedure CopyHeader(var PharmacyHeader: Record "Pharmacy Header"): Code[20]
    var
        PostedHeader: Record "Posted Pharmacy Table";
    begin
        PostedHeader.Init();

        PostedHeader."Pharmacy Issue No" := PharmacyHeader."Pharmacy Issue No";
        PostedHeader."Prescription No" := PharmacyHeader."Prescripion No";
        PostedHeader."Patient No" := PharmacyHeader."Patient No";
        PostedHeader."Patient Name" := PharmacyHeader."Patient Name";
        PostedHeader."Doctor Name" := PharmacyHeader."Doctor Name";
        PostedHeader."Issue date" := PharmacyHeader."Issue Date";
        PostedHeader."Posting date" := Today();
        PostedHeader."Posted By" := UserId();
        PostedHeader.Status := PostedHeader.Status::Posted;

        PostedHeader.Insert(true);

        // Return the generated Posted Pharmacy No
        exit(PostedHeader."Posted Pharmacy No");
    end;
}