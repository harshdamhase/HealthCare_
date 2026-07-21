report 50101 "Prescription"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Src/Layout/Prescription.rdl';

    dataset
    {
        dataitem("Prescription Header"; "Prescription Header")
        {
            RequestFilterFields = "Prescription No";
            column(Prescription_No; "Prescription No")
            {

            }
            column(Consultation_No; "Consultation No")
            {

            }
            column(Patient_No; "Patient No")
            {

            }
            column(Patient_Name; "Patient Name")
            {

            }
            column(Doctor_No; "Doctor No")
            {

            }
            column(Doctor_Name; "Doctor Name")
            {

            }
            column(Notes; Notes)
            {

            }
            column(Prescription_Date; "Prescription Date")
            {

            }
            column(Status; Status)
            {

            }
            dataitem("Prescription Line Table"; "Prescription Line Table")
            {
                DataItemLink = "Prescription No" = field("Prescription No");

                column(Medicine_No; "Medicine No")
                {

                }
                column(Medicine_Name; "Medicine Name")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Dosage; Dosage)
                {

                }
                column(Duration; Duration)
                {

                }
                column(Instructions; Instructions)
                {

                }

            }

        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }


    }


    var
        myInt: Integer;
}