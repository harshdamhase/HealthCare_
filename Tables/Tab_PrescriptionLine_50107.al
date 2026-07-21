table 50107 "Prescription Line Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Prescription No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Medicine No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                RecItem: Record Item;
            begin
                If RecItem.Get("Medicine No") then
                    "Medicine Name" := RecItem.Description;
            end;

        }
        field(4; "Medicine Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Dosage; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "freqeuncy"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Duration"; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Instructions; text[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Prescription No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        NoseriesMgt: codeunit "No. Series";
        PrescriptionLine: Record "Prescription Line Table";
    begin
        if "Prescription No" = '' then
            NoseriesMgt.GetNextNo('P0001');

        if "Line No" = 0 then begin
            PrescriptionLine.Reset();
            PrescriptionLine.SetRange("Prescription No", "Prescription No");

            if PrescriptionLine.FindLast() then
                "Line No" := PrescriptionLine."Line No" + 10000
            else
                "Line No" := 10000;
        end;
    end;



    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}