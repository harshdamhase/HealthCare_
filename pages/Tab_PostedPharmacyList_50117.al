page 50117 "Posted Pharmacy List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Posted pharmacy Line Table";
    CardPageId = "Posted Pharmacy invoice";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Posted Pharmacy No"; Rec."Posted Pharmacy No")
                {

                }
                field("Pharmacy Issue No"; Rec."Pharmacy Issue No")
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
                field("Unit Price Excl. TAX"; Rec."Unit Price Excl. TAX")
                {

                }
                field("Line Amount Excl. TAX"; Rec."Line Amount Excl. TAX")
                {

                }
                field("Department Code"; Rec."Department Code")
                {

                }
                field("Department Name"; Rec."Department Name")
                {

                }
                field("TAX Area Code"; Rec."TAX Area Code")
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