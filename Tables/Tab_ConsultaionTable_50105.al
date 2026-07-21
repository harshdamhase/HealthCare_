table 50105 "Consultation Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Consultation No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Appointment No"; code[20])
        {
            TableRelation = Appointment."Appointment Code";
        }
        field(3; "Patient No"; Code[20])
        {
            TableRelation = "Patient Registration"."Patient No";

            trigger Onvalidate()
            var
                RecPatientRegistr: Record "Patient Registration";

            begin
                if RecPatientRegistr.Get("Patient No") then
                    "Patient Name" := RecPatientRegistr."Patient Name";
            end;
        }
        field(4; "Patient Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Doctor No"; Integer)
        {
            TableRelation = "Doctor Details".DoctorId;

            trigger OnValidate()
            var
                recDoctor: Record "Doctor Details";
            begin
                if recDoctor.Get("Doctor No") then
                    "Doctor Name" := recDoctor."Doctor Name";
                "Consultation fee" := recDoctor."Conusltation Fee";

            end;
        }
        field(14; "Doctor Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Consultation Date"; date)
        {
            Dataclassification = ToBeClassified;
        }
        field(7; Symptoms; text[250])
        {
            Dataclassification = Tobeclassified;
        }
        field(8; Diagnosis; text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Treatment plan"; text[200])
        {
            dataclassification = ToBeClassified;
        }
        field(10; Notes; text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Consultation fee"; decimal)
        {

            DataClassification = Tobeclassified;
        }
        field(12; "Status"; Option)
        {
            OptionMembers = "Completed","Cancelled";
            Dataclassification = ToBeClassified;
        }
        field(17; "Mobile Number"; text[20])
        {
            Dataclassification = Tobeclassified;
        }

    }

    keys
    {
        key(Key1; "Consultation No")
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
    begin
        if "Consultation No" = '' then
            "Consultation No" := NoseriesMgt.GetNextNo('C0001');

        if "Consultation Date" = 0D then
            "Consultation Date" := today;
    end;

    trigger OnModify()
    var
        Appointment: Record "Appointment";
    begin
        if Status = Status::Completed then begin
            if Appointment.Get("Appointment No") then begin
                Appointment.Status := Appointment.Status::Completed;
                Appointment.Modify();
            end;
        end;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}