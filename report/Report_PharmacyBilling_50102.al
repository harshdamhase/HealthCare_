report 50102 "Pharmacy Billing"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Src/Report/Layout/PharmacyBilling_50102.rdl';

    dataset
    {
        dataitem("Pharmacy Header"; "Pharmacy Header")
        {
            RequestFilterFields = "Pharmacy Issue No";
            column(Pharmacy_Issue_No; "Pharmacy Issue No")
            {

            }
            column(Patient_No; "Patient No")
            {

            }
            column(Patient_Name; "Patient Name")
            {

            }
            column(Issue_Date; "Issue Date")
            {

            }
            column(Posting_date; "Posting date")
            {

            }
            column(Posted_By; "Posted By")
            {

            }
            column(Prescripion_No; "Prescripion No")
            {

            }
            column(Mobile_Number; "Mobile Number")
            {

            }
            column(Doctor_No; "Doctor No")
            {

            }
            column(Doctor_Name; "Doctor Name")
            {

            }
            column(compName; compInfo.Name)
            {

            }
            column(compAddress; compInfo.Address)
            {

            }
            column(compAddress2; compInfo."Address 2")
            {

            }
            column(compPhoneNo; compInfo."Phone No.")
            {

            }
            column(compPostCode; compInfo."Post Code")
            {

            }

            dataitem("Pharmacy Line Tab2"; "Pharmacy Line Tab2")
            {
                DataItemLink = "Pharmacy Issue No" = field("Pharmacy Issue No");
                column(Medicine_No; "Medicine No")
                {

                }
                column(Medicine_Name; "Medicine Name")
                {

                }
                column(Line_No; "Line No")
                {

                }
                column(Dosage; Dosage)
                {

                }
                column(Duration; Duration)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Department_Code; "Department Code")
                {

                }
                column(Unit_Price_Excl__TAX; "Unit Price Excl. TAX")
                {

                }
                column(Unit_of_measure_Code; "Unit of measure Code")
                {

                }
                column(Line_Amount_Excl__TAX; "Line Amount Excl. TAX")
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
                group(Option)
                {
                }
            }
        }


    }

    trigger OnPreReport()
    begin
        compInfo.get();
    end;


    var
        myInt: Integer;
        compInfo: Record "Company Information";
}