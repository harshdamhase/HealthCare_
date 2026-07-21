page 50115 "Posted Pharmacy invoice"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Posted Pharmacy Table";
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
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
                field("Issue date"; Rec."Issue date")
                {

                }

                field("Posted By"; Rec."Posted By")
                {

                }
            }
            part(Line; "Posted Pharmacy Subform page")
            {
                SubPageLink = "Posted Pharmacy No" = field("Posted Pharmacy No");
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