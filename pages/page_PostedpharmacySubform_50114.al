page 50114 "Posted Pharmacy Subform page"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Posted pharmacy Line Table";
    AutoSplitKey = true;
    DelayedInsert = true;
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
                field("Line No"; Rec."Line No")
                {

                }
                field("Medicine No"; Rec."Medicine No")
                {

                }
                field("Medicine Name"; Rec."Medicine Name")
                {

                }
                field(Quantity; Rec.Quantity)
                {

                }
                field("Unit Price Excl. TAX"; Rec."Unit Price Excl. TAX")
                {

                }
                field(Dosage; Rec.Dosage)
                {

                }
                field(Duration; Rec.Duration)
                {

                }
                field("Line Amount Excl. TAX"; Rec."Line Amount Excl. TAX")
                {

                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {

                }
                field(Instructions; Rec.Instructions)
                {

                }
                field("Department Code"; Rec."Department Code")
                {

                }
                field("Department Name"; Rec."Department Name")
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