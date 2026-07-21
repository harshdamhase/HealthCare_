page 50109 "Consultation List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Consultation Table";
    CardPageId = "Consultation Card";

    layout
    {
        area(Content)
        {
            repeater(General)
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