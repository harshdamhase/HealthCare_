page 50110 "Prescription Header Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Prescription Header";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Prescription No"; Rec."Prescription No")
                {

                }
                field("Consultation No"; Rec."Consultation No")
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
                field("Prescription Date"; Rec."Prescription Date")
                {

                }
                field(Status; Rec.Status)
                {

                }
                field(Notes; Rec.Notes)
                {
                    MultiLine = true;
                }
            }

            part(PrescriptionLines; "Prescription Subform")
            {
                ApplicationArea = All;

                SubPageLink = "Prescription No" = field("Prescription No");
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                ApplicationArea = All;
                Caption = 'Release';
                Image = ReleaseDoc;

                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                Enabled = Rec.Status = Rec.Status::Open;

                trigger OnAction()
                begin
                    Rec.TestField("Patient No");
                    Rec.TestField("Doctor No");

                    Rec.Status := Rec.Status::Released;
                    Rec.Modify(true);

                    CurrPage.Update();
                    Message('Prescription Released.');
                end;
            }

            action(Reopen)
            {
                ApplicationArea = All;
                Caption = 'Reopen';
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                Enabled = Rec.Status = Rec.Status::Released;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);

                    CurrPage.Update();
                    Message('Prescription Reopened.');
                end;
            }

            group(Posting)
            {
                Caption = 'Post';
                Image = Post;
                ShowAs = SplitButton;

                action(Post)
                {
                    Caption = 'Post';
                    Image = Post;

                    trigger OnAction()
                    var
                        PharmacyMgt: Codeunit "Pharmacy Management";
                        PharmacyHeader: Record "Pharmacy Header";
                    begin
                        Rec.TestField(Status, Rec.Status::Released);

                        PharmacyHeader.Reset();
                        PharmacyHeader.SetRange("Prescripion No", Rec."Prescription No");

                        if PharmacyHeader.FindFirst() then
                            Error('This prescription has already been posted.');

                        PharmacyMgt.CreatePharmacy(Rec);

                        Rec.Status := Rec.Status::Completed;
                        Rec.Modify(true);

                        CurrPage.Update();

                        Message('Prescription posted successfully.');
                    end;
                }

                action(PostAndPrint)
                {
                    Caption = 'Post and Print';
                    Image = PostPrint;

                    trigger OnAction()
                    var
                        PharmacyMgt: Codeunit "Pharmacy Management";
                        PharmacyHeader: Record "Pharmacy Header";
                    begin
                        Rec.TestField(Status, Rec.Status::Released);

                        PharmacyHeader.SetRange("Prescripion No", Rec."Prescription No");

                        if PharmacyHeader.FindFirst() then
                            Error('Already posted.');

                        PharmacyMgt.CreatePharmacy(Rec);

                        Rec.Status := Rec.Status::Completed;
                        Rec.Modify(true);

                        Report.RunModal(50101, true, true, Rec);
                    end;
                }

                action(PreviewPosting)
                {
                    Caption = 'Preview Posting';
                    Image = View;

                    trigger OnAction()
                    begin
                        Message('Preview Posting is not implemented yet.');
                    end;
                }
            }

            action(PrintPrescription)
            {
                Caption = 'Print';
                Image = Print;

                ApplicationArea = All;

                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Report.RunModal(50130, true, true, Rec);
                    Message('Prescription printed');
                end;
            }

            action(CompletePrescription)
            {
                Caption = 'Complete';
                Image = Completed;

                ApplicationArea = All;

                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Completed;
                    Rec.Modify(true);

                    CurrPage.Update();

                    Message('Prescription completed.');
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec."Prescription Date" = 0D then
            Rec."Prescription Date" := Today;
    end;
}