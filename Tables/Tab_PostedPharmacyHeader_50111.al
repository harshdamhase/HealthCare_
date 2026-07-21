table 50111 "Posted Pharmacy Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Posted Pharmacy No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Pharmacy Issue No"; Code[20])
        {
            TableRelation = "Pharmacy Header"."Pharmacy Issue No";
        }
        field(3; "Prescription No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Patient No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Patient Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Doctor No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Doctor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Posting date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Posted By"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Issue date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Status; option)
        {
            OptionMembers = "Open","Released","Posted";
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Posted Pharmacy No")
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
        NoSeries: Codeunit "No. Series";
    begin


        if "Posted Pharmacy No" = '' then begin
            "Posted Pharmacy No" := NoSeries.GetNextNo('POPR001', Today());
            Message('Generated No: %1', "Posted Pharmacy No");
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