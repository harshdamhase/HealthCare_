page 50111 "Prescription Subform"
{
    PageType = Listpart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Prescription Line Table";
    CardPageId = "Prescription Header Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Prescription No"; Rec."Prescription No")
                {

                }
                field("Line No"; Rec."Line No")
                {

                }
                field("Medicine No"; Rec."Medicine No")
                {

                }
                field("Medicine Name"; Rec."Medicine Name")
                {

                }
                field(Dosage; Rec.Dosage)
                {

                }
                field(Duration; Rec.Duration)
                {

                }
                field(Quantity; Rec.Quantity)
                {

                }
                field(Instructions; Rec.Instructions)
                {

                }
            }
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