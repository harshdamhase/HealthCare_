page 50107 "Consultation Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Consultation Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Consultation No"; Rec."Consultation No")
                {

                }
                field("Appointment No"; Rec."Appointment No")
                {

                }
                field("Patient No"; Rec."Patient No")
                {

                }
                field("Patient Name"; Rec."Patient Name")
                {

                }
                field("Doctor No"; Rec."Doctor No")
                {

                }
                field("Doctor Name"; Rec."Doctor Name")
                {

                }
                field("Consultation Date"; Rec."Consultation Date")
                {

                }
                field(Symptoms; Rec.Symptoms)
                {

                }
                field(Diagnosis; Rec.Diagnosis)
                {

                }
                field("Treatment plan"; Rec."Treatment plan")
                {

                }
                field(Notes; Rec.Notes)
                {
                    MultiLine = true;
                }
                field("Consultation fee"; Rec."Consultation fee")
                {

                }
                field(Status; Rec.Status)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Complete Consultation")
            {
                Caption = 'Complete Consultation';
                Image = Approve;
                Promoted = true;
                promotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    Appointment: Record "Appointment";
                begin
                    Rec.Status := Rec.Status::Completed;
                    Rec.Modify();

                    if Appointment.Get(Rec."Appointment No") then begin
                        Appointment.Status := Appointment.Status::Completed;
                        Appointment.Modify();


                    end;

                    Message('Consultation completed successfully.');
                end;
            }
            action(CreatePrescription)
            {
                ApplicationArea = All;
                Caption = 'Create Prescription';
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PrescriptionHdr: Record "Prescription Header";
                begin
                    // Don't create duplicate prescription
                    PrescriptionHdr.Reset();
                    PrescriptionHdr.SetRange("Consultation No", Rec."Consultation No");

                    if PrescriptionHdr.FindFirst() then begin
                        Page.Run(Page::"Prescription Header Card", PrescriptionHdr);
                        exit;
                    end;

                    PrescriptionHdr.Init();

                    PrescriptionHdr.Validate("Consultation No", Rec."Consultation No");
                    PrescriptionHdr.Validate("Patient No", Rec."Patient No");

                    PrescriptionHdr."Patient Name" := Rec."Patient Name";
                    PrescriptionHdr."Doctor No" := Rec."Doctor No";
                    PrescriptionHdr."Doctor Name" := Rec."Doctor Name";

                    PrescriptionHdr."Prescription Date" := Today;

                    PrescriptionHdr.Insert(true);

                    Page.Run(Page::"Prescription Header Card", PrescriptionHdr);
                end;
            }

        }
    }
    var
        myInt: Integer;
}