table 50108 "Pharmacy Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Pharmacy Issue No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Prescripion No"; Code[20])
        {
            TableRelation = "Prescription Header"."Prescription No";
        }
        field(3; "Patient No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Patient Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Mobile Number"; text[20])
        {
            Dataclassification = Tobeclassified;
        }
        field(5; "Doctor No"; Integer)
        {
            // TableRelation = "Doctor Details".DoctorId;
        }
        field(6; "Doctor Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Issue Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Status; option)
        {
            OptionMembers = "Open","Released","Posted";
            DataClassification = ToBeClassified;
        }
        field(9; "Posting date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Posted By"; text[100])
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
        // Add changes to field groups here
    }


    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
    begin
        if "Pharmacy Issue No" = '' then
            "Pharmacy Issue No" := NoSeries.GetNextNo('PRM001', Today);

        if "Issue Date" = 0D then
            "Issue Date" := Today;

        If "Posting date" = 0D then
            "Posting date" := Today;
    end;

    trigger OnModify()
    begin
        if Status = Status::Posted then
            Error('Posted documents cannot be modified.');
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}