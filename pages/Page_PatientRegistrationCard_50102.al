page 50102 "Patient Resgistration Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Patient Registration";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Patient No"; Rec."Patient No")
                {

                }
                field("Patient Name"; Rec."Patient Name")
                {

                }
                field("Patient Age"; Rec."Patient Age")
                {

                }
                field("Gender"; Rec.Gender)
                {

                }
                field("Date of birth"; Rec."Date of Birth")
                {

                }
                field("Address"; Rec.Address)
                {

                }
                field("Mobile No"; Rec."Mobile Number")
                {

                }
                field(Email; Rec.Email)
                {

                }
                field("Blood Group"; Rec."Blood Group")
                {

                }
                field(MedicalHistory; Rec.MedicalHistory)
                {

                }
                field(Allergies; Rec.Allergies)
                { }
                field(EmergencyContact; Rec."Emergency Contact")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PatientRegistration)
            {
                applicationArea = All;
                caption = 'Register Pateint';
                Image = Register;
                Promoted = true;
                promotedCategory = process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    RecPatientRegistration: Record "Patient Registration";
                begin
                    Message('Patient Registered Successfully!!');
                    //page.Run(page::"Patient Registration List", RecPatientRegistration);
                end;
            }
            action(Uodatepatient)
            {
                Caption = 'Update Patient';
                ApplicationArea = All;
                Image = Edit;
                promoted = true;
                promotedCategory = process;
                promotedOnly = true;

                trigger OnAction()

                Var
                    RecPatientRegistration: Record "Patient Registration";

                begin
                    Rec.Modify(true);
                    Message('Patient Record Update Succesfully!!');
                end;
            }
            action(Appoinment)
            {
                caption = 'Take Appoinment';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                PromotedOnly = true;
                image = Apply;


                trigger OnAction()

                var
                    Appointment: Record "Appointment";

                begin
                    Appointment.Init();
                    Appointment.Insert(true);

                    Appointment.Validate("Patient No", Rec."Patient No");
                    Appointment.Validate("Patient Name", Rec."Patient Name");
                    Appointment.Modify(true);

                    PAGE.Run(PAGE::"Appointment Card", Appointment);
                end;

            }
        }

    }

    var
        myInt: Integer;
}