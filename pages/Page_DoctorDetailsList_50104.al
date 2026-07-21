page 50104 "Doctor Details List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Doctor Details";
    CardPageId = "Doctor Details Card";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
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