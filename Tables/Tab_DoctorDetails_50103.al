table 50103 "Doctor Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; DoctorId; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Doctor Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Department; text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(15; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            tableRelation = "Dimension Value".Code;

            trigger onValidate()
            var
                DimensionValue: Record "Dimension Value";
            begin
                if DimensionValue.Get('DEPARTMENT', "Department Code") then
                    "Department Name" := DimensionValue.Name;
            end;
        }
        field(14; "Department Name"; text[100])
        {
            DataClassification = ToBeClassified;


        }
        field(4; "Doctor specialization"; text[100])
        {
            Dataclassification = tobeclassified;
        }
        field(5; "Doctor Experience"; Integer)
        {
            Dataclassification = tobeclassified;
        }
        field(6; "Conusltation Fee"; Decimal)
        {
            Dataclassification = tobeclassified;
        }
        field(7; "Available time"; Time)
        {
            Dataclassification = tobeclassified;
        }
        field(8; "Phone No"; text[20])
        {
            Dataclassification = tobeclassified;
        }
        field(9; Email; text[50])
        {
            Dataclassification = tobeclassified;
        }
    }

    keys
    {
        key(Key1; DoctorId)
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