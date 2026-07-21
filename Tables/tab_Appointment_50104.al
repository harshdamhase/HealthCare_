table 50104 "Appointment"
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Appointment Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Patient No"; Code[20])
        {
            Dataclassification = Tobeclassified;
            tableRelation = "Patient Registration"."Patient No";

            trigger OnValidate()
            var
                RecPatient: Record "Patient Registration";
            begin
                if RecPatient.Get("Patient No") then
                    "Patient Name" := RecPatient."Patient Name";
            end;
        }
        field(3; "Patient Name"; Text[100])
        {
            Dataclassification = tobeclassified;
        }
        field(4; "Doctor No"; Integer)
        {
            Dataclassification = tobeclassified;
            tableRelation = "Doctor details".DoctorId;

            trigger onValidate()
            var
                DoctorManagement: Record "Doctor details";
            begin
                if Doctormanagement.Get("Doctor No") then
                    "Doctor Name" := DoctorManagement."Doctor Name";
                "Department Code" := DoctorManagement."Department Code";
                "Consulation fee" := DoctorManagement."Conusltation Fee";
            end;
        }
        field(5; "Doctor Name"; Text[100])
        {
            Dataclassification = tobeclassified;

        }
        field(6; "Appointment Date"; Date)
        {
            Dataclassification = tobeclassified;
        }
        field(7; "Appointment time"; time)
        {
            Dataclassification = tobeclassified;
        }
        field(8; "Department Code"; Code[20])
        {
            Dataclassification = tobeclassified;
            tablerelation = "Dimension Value".Code;

            trigger onValidate()
            var
                DimensionValue: Record "Dimension Value";
            begin
                if DimensionValue.Get('DEPARTMENT', "Department Code") then
                    "Department Name" := DimensionValue.Name;
            end;
        }
        field(9; "Department Name"; Text[100])
        {
            Dataclassification = tobeclassified;
        }
        field(10; "Reason for Appointment"; text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(11; status; option)
        {
            OptionMembers = "Scheduled","Completed","Cancelled";
            DataClassification = ToBeClassified;
        }
        field(14; "Consulation fee"; decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Notes; text[20])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Appointment Code")
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
        Noseriesmgt: codeunit "No. Series";
    begin
        if "Appointment Code" = ''
        then
            "Appointment Code" := Noseriesmgt.GetNextNo('A0001');

        if "Appointment Date" = 0D then
            "Appointment Date" := today;
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