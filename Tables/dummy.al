table 50109 "Pharmacy Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Pharmacy Issue No"; Code[20])
        {
            TableRelation = "Pharmacy Header"."Pharmacy Issue No";

        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Medicine No"; Code[20])
        {
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
        field(5; Quantity; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
            begin
                CalCulateLineAmt();
            end;
        }
        field(6; "Unit Price Excl. TAX"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger onValidate()
            begin
                CalCulateLineAmt();
            end;

        }
        field(7; "Unit of measure Code"; Code[20])
        {
            TableRelation = "Unit of Measure".Code;
        }
        field(8; "Tax AREA Code"; Code[20])
        {
            TableRelation = "Tax Area".Code;
        }
        field(9; "Line Amount Excl. TAX"; Decimal)
        {
            Editable = false;
        }
        field(10; "Department Code"; Code[20])
        {
            TableRelation = Dimension.Code;

            trigger OnValidate()
            var
                RecDimension: Record Dimension;
            begin
                if RecDimension.Get("Department Code") then
                    "Department Name" := RecDimension.Name;
            end;
        }
        field(11; "Department Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Dosage; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Duration; text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Pharmacy Issue No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {

    }

    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
    begin
        "Line No" := 10000;
        // if "Pharmacy Issue No" = '' then
        //     "Pharmacy Issue No" := NoSeries.GetNextNo('PHARM', Today);
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

    local procedure CalCulateLineAmt()
    begin
        "Line Amount Excl. TAX" := "Unit Price Excl. TAX" * Quantity;
    end;
}