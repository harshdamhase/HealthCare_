table 50112 "Posted pharmacy Line Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Posted Pharmacy No"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(15; "Pharmacy Issue No"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Medicine No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Medicine Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Dosage"; text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(7; "Unit Price Excl. TAX"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Line Amount Excl. TAX"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Unit of Measure Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(10; "TAX Area Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(11; Duration; Text[20])
        {
        }
        field(12; Instructions; Text[100])
        {
        }

        field(13; "Department Code"; Code[20])
        {
        }

        field(14; "Department Name"; Text[100])
        {
        }

    }

    keys
    {
        key(Key1; "Posted Pharmacy No", "Line No")
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
    begin

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