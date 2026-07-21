page 50112 "Posted Pharmacy Header"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Posted Pharmacy Table";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Posted Pharmacy No"; Rec."Posted Pharmacy No")
                {

                }
                field("Pharmacy Issue No"; Rec."Pharmacy Issue No")
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
                field("Posting date"; Rec."Posting date")
                {

                }
                Field("Issue date"; Rec."Issue date")
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

    var
        myInt: Integer;
}