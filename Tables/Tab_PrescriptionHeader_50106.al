table 50106 "Prescription Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Prescription No"; Code[20])
        {
            DataClassification = tobeclassified;
        }
        field(2; "Consultation No"; Code[20])
        {
            TableRelation = "Consultation Table"."Consultation No";
            DataClassification = Tobeclassified;

            trigger OnValidate()
            var
                Consultation: Record "Consultation Table";
            begin
                if Consultation.Get("Consultation No") then begin
                    "Patient No" := Consultation."Patient No";
                    "Patient Name" := Consultation."Patient Name";
                    "Mobile Number" := Consultation."Mobile Number";
                    "Doctor No" := Consultation."Doctor No";
                    "Doctor Name" := Consultation."Doctor Name";
                end;
            end;
        }
        field(3; "Patient No"; Code[20])
        {
            // TableRelation = "Patient Registration"."Patient No";

            trigger OnValidate()
            var
                RecPatientRegister: Record "Patient Registration";

            begin

            end;
        }
        field(4; "Patient Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Contact No"; code[20])
        {

        }
        field(5; "Doctor No"; Integer)
        {
            // TableRelation = "Doctor Details".DoctorId;

            trigger OnValidate()
            var
                RecDoctor: Record "Doctor Details";

            begin
                // if RecDoctor.Get("Doctor No") then
                //     "Doctor Name" := RecDoctor."Doctor Name";
            end;

        }
        field(6; "Doctor Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Prescription Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Status"; Enum "Status Enum")
        {
            DataClassification = ToBeClassified;
        }
        field(9; Notes; text[250])
        {
            caption = 'Additional instructions';
            DataClassification = ToBeClassified;
        }
        field(10; "Mobile Number"; text[20])
        {
            Dataclassification = Tobeclassified;
        }
    }

    keys
    {
        key(Key1; "Prescription No")
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
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "Prescription No" = '' then
            "Prescription No" := NoSeriesMgt.GetNextNo('PRES');

        if "Prescription Date" = 0D then
            "Prescription Date" := Today;
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