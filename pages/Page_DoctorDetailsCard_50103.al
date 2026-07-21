page 50103 "Doctor Details Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Doctor Details";


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(DoctorId; Rec.DoctorId)
                {

                }
                field(DoctorName; Rec."Doctor Name")
                {

                }
                field(Department; Rec.Department)
                {
                    visible = false;
                }
                field(DepartmentCode; Rec."Department Code")
                {

                }
                field(DepartmentName; Rec."Department Name")
                {

                }
                field("Doctor Specialization"; Rec."Doctor specialization")
                {

                }
                field("Doctor Experience"; Rec."Doctor Experience")
                {

                }
                field("Consultation Fee"; Rec."Conusltation Fee")
                {

                }
                field("Available Time"; Rec."Available time")
                {

                }

                field(phoneNo; Rec."Phone No")
                {

                }
                field(Email; Rec.Email)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Save)
            {
                Image = Save;
                ApplicationArea = All;
                Promoted = true;
                promotedCategory = process;


                trigger OnAction()
                begin
                    message('Doctor Details Saved Successfully!!');
                end;
            }
        }
    }

    var
        myInt: Integer;
}