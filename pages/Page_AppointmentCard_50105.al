page 50105 "Appointment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Appointment;

    layout
    {
        area(Content)
        {
            group(General)
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
            }
            group(Schedule)
            {
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
            }
            group(Details)
            {
                field("Reason for Appointment"; Rec."Reason for Appointment")
                {

                }
                field("Consulation fee"; Rec."Consulation fee")
                {

                }
                field(status; Rec.status)
                {

                }
                field(Notes; Rec.Notes)
                {
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AppointmentConfirm)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                image = Confirm;
                caption = 'Appoinment Confirm';

                trigger OnAction()
                begin
                    Message('Appointment Confirm!!!');
                end;

            }
            action(Consultation)
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                caption = 'Consult Here';

                trigger OnAction()
                var
                    Consultation: Record "Consultation Table";
                begin
                    Consultation.SetRange("Appointment No", Rec."Appointment Code");

                    if Consultation.FindFirst() then begin
                        PAGE.Run(PAGE::"Consultation Card", Consultation);
                        exit;
                    end;

                    Consultation.Init();
                    Consultation.Validate("Appointment No", Rec."Appointment Code");
                    Consultation.Validate("Patient No", Rec."Patient No");
                    Consultation.Validate("Doctor No", Rec."Doctor No");
                    Consultation.Insert(true);

                    PAGE.Run(PAGE::"Consultation Card", Consultation);
                end;
            }
        }
    }


    var
        myInt: Integer;
}