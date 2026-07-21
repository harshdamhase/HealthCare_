page 50116 "Pharmacy Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Pharmacy Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Pharmacy Issue No"; Rec."Pharmacy Issue No")
                {
                    Visible = false;
                }
                field("Prescripion No"; Rec."Prescripion No")
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
                field("Issue Date"; Rec."Issue Date")
                {

                }
                field("Posting date"; Rec."Posting date")
                {

                }
                field(Status; Rec.Status)
                {

                }
            }
            part(Line; "Pharmcy Subform page")
            {
                SubPageLink = "Pharmacy Issue No" = field("Pharmacy Issue No");
                ApplicationArea = All;
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(IssueMedicine)
            {
                Caption = 'Issue Medicine';
                Image = Post;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                    Message('Medicine issued successfully.');
                end;
            }

            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Print Pharmacy Slip');
                end;
            }
            action(Post)
            {
                Caption = 'Post Order';
                Image = Post;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    HeaderMgt: Codeunit "Posted Pharmacy Header";
                    LineMgt: Codeunit "Posted Pharmacy Line Mgt";
                    PostedHeader: Record "Posted Pharmacy Table";
                    PostedNo: Code[20];
                begin
                    PostedNo := HeaderMgt.CopyHeader(Rec);

                    LineMgt.CopyLine(Rec, PostedNo);

                    if PostedHeader.Get(PostedNo) then
                        Page.Run(Page::"Posted Pharmacy invoice", PostedHeader);
                end;
            }
        }

    }
    trigger OnOpenPage()
    begin
        CurrPage.Editable := Rec.Status = Rec.Status::Open;
    end;

    var
        myInt: Integer;
}