table 50102 "Patient Registration"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Patient No"; Code[20])
        {
            DataClassification = ToBeClassified;
            //AutoIncrement = true;
        }
        field(2; "Patient Name"; text[100])
        {
            DataClassification = tobeclassified;
        }
        field(3; "Patient Age"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Gender"; Option)
        {
            optionMembers = Male,female,Other;
            DataClassification = Tobeclassified;
        }
        field(5; "Date of Birth"; Date)
        {
            Dataclassification = Tobeclassified;
        }
        field(6; "Address"; Text[100])
        {
            Dataclassification = Tobeclassified;
        }
        field(7; "Mobile Number"; text[20])
        {
            Dataclassification = Tobeclassified;
        }
        field(8; "Email"; Text[50])
        {
            Dataclassification = Tobeclassified;
        }
        field(9; "Blood Group"; Option)
        {
            OptionMembers = "A+","A-","B+","B-","AB+","AB-","O+","O-";
            Dataclassification = Tobeclassified;
        }
        field(10; MedicalHistory; Text[100])
        {
            Dataclassification = Tobeclassified;
        }
        field(11; "Allergies"; Text[100])
        {
            Dataclassification = Tobeclassified;
        }
        field(12; "Emergency Contact"; Text[100])
        {
            Dataclassification = Tobeclassified;
        }
    }


    keys
    {
        key(Key1; "Patient No")
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
        //     RecHealthCareSetup: Record "HealthCare Setup Tab";
        NoSeriesmgt: codeunit "No. Series";
    begin
        if "Patient No" = '' then
            "Patient No" := NoSeriesmgt.GetNextNo('P0001');
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