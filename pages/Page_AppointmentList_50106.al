page 50106 "Appointment list"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Appointment;
    CardPageId = "Appointment Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Appointment Code"; Rec."Appointment Code")
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
                field("Appointment Date"; Rec."Appointment Date")
                {

                }
                field("Appointment time"; Rec."Appointment time")
                {

                }
                field("Department Code"; Rec."Department Code")
                {

                }
                field("Department Name"; Rec."Department Name")
                {

                }
                field("Reason for Appointment"; Rec."Reason for Appointment")
                {

                }
                field(status; Rec.status)
                {

                }
                field("Consulation fee"; Rec."Consulation fee")
                {

                }
                field(Notes; Rec.Notes)
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