page 50101 "Patient Registration List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Patient Registration";
    cardpageId = "Patient Resgistration Card";

    layout
    {
        area(Content)
        {
            repeater(General)
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
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}