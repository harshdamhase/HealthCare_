codeunit 50103 "Posted Pharmacy Line Mgt"
{
    procedure CopyLine(var PharmacyHeader: Record "Pharmacy Header"; PostedPharmacyNo: Code[20])
    var
        PharmacyLine: Record "Pharmacy Line Tab2";
        PostedLine: Record "Posted pharmacy Line Table";
    begin
        PharmacyLine.SetRange("Pharmacy Issue No", PharmacyHeader."Pharmacy Issue No");

        if PharmacyLine.FindSet() then begin
            Message('Found %1 line(s)', PharmacyLine.Count);

            repeat
                Message('Copying Line No %1', PharmacyLine."Line No");

                PostedLine.Init();
                PostedLine."Posted Pharmacy No" := PostedPharmacyNo;
                PostedLine."Pharmacy Issue No" := PharmacyLine."Pharmacy Issue No";
                PostedLine."Line No" := PharmacyLine."Line No";
                PostedLine."Medicine No" := PharmacyLine."Medicine No";
                PostedLine."Medicine Name" := PharmacyLine."Medicine Name";
                PostedLine.Quantity := PharmacyLine.Quantity;
                PostedLine."Unit Price Excl. TAX" := PharmacyLine."Unit Price Excl. TAX";
                PostedLine.Dosage := PharmacyLine.Dosage;
                PostedLine.Duration := PharmacyLine.Duration;
                PostedLine."Unit of Measure Code" := PharmacyLine."Unit of Measure Code";
                PostedLine.Instructions := PharmacyLine.Instructions;
                PostedLine."Line Amount Excl. TAX" := PharmacyLine."Line Amount Excl. TAX";
                PostedLine."Department Code" := PostedLine."Department Code";
                PostedLine."Department Name" := PostedLine."Department Name";
                PostedLine.Insert();

            until PharmacyLine.Next() = 0;
        end else
            Error('No Pharmacy Lines Found for %1', PharmacyHeader."Pharmacy Issue No");
    end;
}