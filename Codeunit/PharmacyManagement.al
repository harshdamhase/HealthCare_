codeunit 50130 "Pharmacy Management"
{
    procedure CreatePharmacy(var PrescriptionHeader: Record "Prescription Header")
    var
        PharmacyHeader: Record "Pharmacy Header";
        PharmacyLine: Record "Pharmacy Line tab2";
        PrescriptionLine: Record "Prescription Line Table";
        PharmacyCard: Page "Pharmacy Card";
    begin
        // Create Header
        PharmacyHeader.Init();
        PharmacyHeader.Insert(true);

        PharmacyHeader."Prescripion No" := PrescriptionHeader."Prescription No";
        PharmacyHeader."Patient No" := PrescriptionHeader."Patient No";
        PharmacyHeader."Patient Name" := PrescriptionHeader."Patient Name";
        PharmacyHeader."Doctor No" := PrescriptionHeader."Doctor No";
        PharmacyHeader."Doctor Name" := PrescriptionHeader."Doctor Name";
        PharmacyHeader."Issue Date" := Today;


        PharmacyHeader.Modify(true);

        // Copy Prescription Lines
        PrescriptionLine.Reset();
        PrescriptionLine.SetRange("Prescription No", PrescriptionHeader."Prescription No");

        if PrescriptionLine.FindSet() then
            repeat
                PharmacyLine.Init();

                PharmacyLine."Pharmacy Issue No" := PharmacyHeader."Pharmacy Issue No";
                PharmacyLine."Line No" := PrescriptionLine."Line No";
                PharmacyLine."Medicine No" := PrescriptionLine."Medicine No";
                PharmacyLine."Medicine Name" := PrescriptionLine."Medicine Name";
                PharmacyLine.Quantity := Round(PrescriptionLine.Quantity, 1);
                PharmacyLine.Dosage := PrescriptionLine.Dosage;
                PharmacyLine.Duration := PrescriptionLine.Duration;


                PharmacyLine.Insert(true);

            until PrescriptionLine.Next() = 0;

        Message('Prescription successfully transferred to Pharmacy.');

        PharmacyCard.SetRecord(PharmacyHeader);
        PharmacyCard.Run();
    end;
}