table 50110 "Pharmacy Line Tab2"
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
        }

        field(3; "Medicine No"; Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                ItemRec: Record Item;
            begin
                if ItemRec.Get("Medicine No") then begin
                    "Medicine Name" := ItemRec.Description;
                    "Unit Price Excl. TAX" := ItemRec."Unit Price";
                    "Unit of Measure Code" := ItemRec."Base Unit of Measure";
                end;
            end;
        }

        field(4; "Medicine Name"; Text[100])
        {
        }

        field(5; Quantity; Decimal)
        {
            trigger OnValidate()
            begin
                CalculateLineAmount();
            end;
        }

        field(6; "Unit Price Excl. TAX"; Decimal)
        {
            trigger OnValidate()
            begin
                CalculateLineAmount();
            end;
        }

        field(7; "Unit of Measure Code"; Code[20])
        {
            TableRelation = "Unit of Measure".Code;
        }

        field(8; "Tax Area Code"; Code[20])
        {
            TableRelation = "Tax Area".Code;
        }

        field(9; "Line Amount Excl. TAX"; Decimal)
        {
            Editable = false;
        }

        field(10; Dosage; Text[20])
        {
        }

        field(11; Duration; Text[20])
        {
        }

        field(12; Instructions; Text[100])
        {
        }

        field(13; "Department Code"; Code[20])
        {
            TableRelation = Dimension.Code;
        }

        field(14; "Department Name"; Text[100])
        {
        }

    }

    keys
    {
        key(PK; "Pharmacy Issue No", "Line No")
        {
            Clustered = true;
        }
    }

    local procedure CalculateLineAmount()
    begin
        "Line Amount Excl. TAX" := Quantity * "Unit Price Excl. TAX";
    end;
}