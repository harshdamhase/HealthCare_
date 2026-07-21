page 50113 "Pharmcy Subform page"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Pharmacy Line Tab2";
    CardPageId = "Pharmacy Card";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Pharmacy Issue No"; Rec."Pharmacy Issue No")
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

                field("Unit of measure Code"; Rec."Unit of measure Code")
                {

                }
                field("Line Amount Excl. TAX"; Rec."Line Amount Excl. TAX")
                {

                }
                field("Tax AREA Code"; Rec."Tax AREA Code")
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
