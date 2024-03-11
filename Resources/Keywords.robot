*** Settings ***
Library    ../../venv/Lib/site-packages/SeleniumLibrary/__init__.py
*** Keywords ***
Suite Setup
        Set Screenshot Directory    ../Output/Screenshots
        Move Files    ../Output/Screenshots/*.png    ../Output/Before_Test_Logs/
        Move Files    ../Output/Logs/*.html    ../Output/Before_Test_Logs/
        Log to console    Old reports and screenshots were moved. Starting test case now
        Login_Setup    ${Username}    ${Password}    ${targeted_env}

Previous Consideration
        SKIP IF        '${PREV TEST STATUS}'=='FAIL' or '${PREV TEST STATUS}'=='SKIP'  Previous test has been failed

Login_Setup
        [Arguments]    ${Username}     ${Password}    ${targeted_env}
        Set Global Variable    ${GlobalTimeout}     20s
        # Verify Future Date
        Open Browser        https://auth.${targeted_env}.absaaccess.africa/         chrome
        Maximize Browser Window
        Wait Until Page Contains    Welcome to Absa Access     timeout=${GlobalTimeout}
        Element Should Be Enabled        //a[@class = 'sol-branding__logo']
        Set Window Size    1920    1080
        Wait Until Page Contains Element    ${LoginLink}    timeout=${GlobalTimeout}
        Click Link    ${LoginLink}
        #Execute Javascript    document.body.style.zoom = "0.8"
        Wait Until Page Contains Element    ${Username_TextBox}
        Input Text    ${Username_TextBox}    ${Username}
        Input Text    ${Password_TextBox}    ${Password}
        Click Button    ${Login_Button}
        #Page should contain    ${Welcome_Path}
        Wait Until Page Does Not Contain Element    ${Loader}
        Wait Until Page Does Not Contain Element    ${Spinner}
        Page Should Not Contain Element    ${Loader}
        Page Should Not Contain Element    ${Spinner}
        Wait Until Page Contains    ${Welcome_Path}
        Run Keyword And Continue On Failure    Run Keyword And Ignore Error    Page should contain       ${Welcome_Logout}    timeout=${GlobalTimeout}
        Capture Page Screenshot        Login_Page.png


Suite Teardown
        Run Keyword And Continue On Failure    Run Keyword And Ignore Error    Click Element        ${Logout_Button}
        Sleep    5s


Click on Launch Button

        Wait Until Page Contains Element     ${Launch_Button}    timeout=${GlobalTimeout}
        Click Button    ${Launch_Button}
        Wait for page to be loaded
#        Element Text Should Be     //h2[text() = 'Cross-border payment requests']     Cross-border payment requests
        Wait Until Page Contains Element     ${Launch_Link}    timeout=${GlobalTimeout}
        Click Link      ${Launch_Link}
        Verify Page is loaded and continue
        Capture Page Screenshot        Dashboard_HomePage.png


Create Payment Request
        Wait Until Page Contains Element     ${Create_Request}    timeout=${GlobalTimeout}
        Page should contain element     ${Main_Title}
        ${refresh}    Run keyword and return status     click element     ${refresh_button}
        IF    '${refresh}'=='True'
            Log     Clicked on refresh button
        END
        sleep    2s
        ${refresh_label}    Run keyword and return status    Page should contain element    ${refresh_button}
        IF    '${refresh_label}'=='True'
            Run keyword and continue on failure    Run keyword and ignore error     Refresh button is validated
        END
        ${Date_of_request_label}    Run keyword and return status    Page should contain element    ${Date_of_request}
        IF    '${Date_of_request_label}'=='True'
            Run keyword and continue on failure    Run keyword and ignore error     Date of request label is validated
        END
        ${request_to_label}    Run keyword and return status    Page should contain element    ${request_to}
        IF    '${request_to_label}'=='True'
            Run keyword and continue on failure    Run keyword and ignore error      Request to label is validated
        END
        ${Request_amount_label}    Run keyword and return status    Page should contain element    ${Request_amount}
        IF    '${Request_amount_label}'=='True'
            Run keyword and continue on failure    Run keyword and ignore error     Request amount label is validated
        END
        ${Payment_Due_label}    Run keyword and return status    Page should contain element    ${Payment_Due}
        IF    '${Payment_Due_label}'=='True'
            Run keyword and continue on failure    Run keyword and ignore error     Payment Due label is validated
        END
        ${Payment_Status_Label}    Run keyword and return status    Page should contain element    ${Payment_Status}
        IF    '${Payment_Status_Label}'=='True'
            Run keyword and continue on failure    Run keyword and ignore error     Payment Status label is validated
        END
        Page should contain element     ${sort_button}
        Log    Sort Button on "date of request" is validated
        Click Button    ${Create_Request}
        Page Should Not Contain Element    ${Spinner}

Verify Page is loaded and continue
        [Arguments]
        Wait Until Page Contains Element     ${Create_Request}    timeout=${GlobalTimeout}
        Click Button    ${Create_Request}

Insert Payment Details
        Capture Page Screenshot     Payment_Blank_page.png
        Page Should Contain    Country
        Page Should Contain    ABSA verified company
        Page Should Contain    Amount you want to receive
        Page Should Contain    Preferred payment account
        Page Should Contain    Currency
        Page Should Contain    Expected payment date
        Page Should Contain    Payment details        
        Wait Until Page Contains Element     ${Currency_Amount}   timeout=${GlobalTimeout}
        Wait for page to be loaded
        ${Country_Button_status}    Run keyword and return status    Element should be disabled     ${Country_Disable}
        Should be true     ${Country_Button_status}
        Click Element       ${Select_Company}
        Element Text Should Be     ${Company_Label_Name}    ${company_label}
        Click Element       ${Company_name_Selector}
        Page should contain    ${Company_Name}
        ${Currency_Button_status}    Run keyword and return status    Element should be disabled     ${Currency_Disable}
        Should be true     ${Currency_Button_status}
        Input Text          ${Currency_Amount}        ${Amount}
        ${Entered_Amount}    Run keyword and continue on failure    Get Value     ${Currency_Amount}
        Should be Equal   ${Entered_Amount}   ${Amount}
        Wait Until Page Contains Element     ${Preffered_Payment_Account}   timeout=${GlobalTimeout}    # Mandatory element verification please don't remove this
        Click Element       ${Preffered_Payment_Account}
        Click Element       ${Select_Payment_Account}
        Input Text          ${Input_Date}        ${Expected_Payment_Date}
        ${Date_store}    Run keyword and continue on failure    Get Value     ${Input_Date}
        Should be Equal   ${Date_store}   ${Expected_Payment_Date}
        #Element Should Contain       ${Input_Date}     ${Expected_Payment_Date}
        Capture Page Screenshot     Filled_Payment_Details.png
        Wait for page to be loaded
        Click Button        ${Continue_Payment_Details}
        Wait Until Page Contains Element     ${Select_Category}    timeout=${GlobalTimeout}
        Wait for page to be loaded       # Mandatory wait can't pass dynamic here
        Page should contain element     ${Cancel}
        Click Element     ${Select_Category}
        Capture Page Screenshot        Entered_Details.png


Transaction Reason and continue
        Capture Page Screenshot        Blank_Transaction_Reason.png
        Page Should Contain    Purpose of payment
        Page Should Contain    Exchange control Reason
        Page Should Contain    Amount accounted for
        Page Should Contain    Add category
        Input Text        ${Search_Category}       ${Transaction_Reason}
        Wait for page to be loaded
        Click Element     ${Add_Category}
        Wait for page to be loaded
        Page Should Contain Element     ${Add_Category}
        Capture Page Screenshot        Entered_Reason.png
        Click Button        ${Continue_Payment_Details}
        Wait for page to be loaded

File Select and Upload
        Page Should Contain    Document upload
        Page Should Contain    Drag and drop upload or choose a file
        Page Should Contain    Maximum file size 5 MB per document | Only PDF, JPEG, JPG, PNG, TIFF, BMP files are supported
        Wait Until Page Contains Element     ${File_Selector}    timeout=${GlobalTimeout}
        Page Should Contain Element     ${File_Selector}

        Choose File     ${File_Selector}    ${FILE_PATH}
        sleep     ${File_upload_time}
#        ${Upload_status}     Run keyword and return status     Run keyword and continue on failure    Wait Until Page Contains Element    ${Trash_Box}     ${File_upload_time}    # waiting until file is uploaded successfully
#        IF    '${Upload_status}'=='False'
#                FAIL     File upload is not successful check path and format or increase File_upload_time value to highest expected
#        END
        #Capture Page Screenshot        Upload_Page.png

#Payment Request Review
        Wait Until Page Contains Element     ${Continue_Payment_Details}    timeout=${GlobalTimeout}
        Click Button    ${Continue_Payment_Details}      # CONTINUE button
        Page Should Contain Element     ${Continue_Payment_Details}
        Capture Page Screenshot        Payment_Review.png

Payment Request Summary
        Page Should Contain    Review details
        Page Should Contain    Payment request
        Page Should Contain    ABSA verified company
        Page Should Contain    Amount
        Page Should Contain    Preferred payment account
        Page Should Contain    Expected payment date
        Page Should Contain    Request date        
        Page Should Contain    Exchange control reason        
        Page Should Contain    Document upload
        Page Should Contain    Document(s)
        Page Should Contain    1 invoice(s)        
        #Page Should Contain Element     ${Review_Details}
Submit Payment Request
        Wait Until Page Contains Element     ${Continue_Payment_Details}    timeout=${GlobalTimeout}
        Click Button    ${Continue_Payment_Details}     #submit button
        Wait for page to be loaded
        Page should contain element     ${Submitted_Text}
        Capture Page Screenshot        Submission_Successful.png
Summary after submission
        Page Should Contain    Submitted
        Page Should Contain    Your payment request has been made.
        Page Should Contain    Summary - Reference Number: RTCB-R
        Page Should Contain    Payment request details
        Page Should Contain    Request date
        Page Should Contain    Amount
        Page Should Contain    ABSA verified company
        Page Should Contain    Preferred payment account
        Page Should Contain    Due date
        Page Should Contain    BoP category
        Page Should Contain    Document(s)

Verify Future Date
        Log to console      Validating Date...
        ${current_date}=    Get Current Date
        ${date} =    Convert Date    ${current_date}    result_format=%Y%m%d
        Set Suite Variable    ${date}    ${date}
        ${future_date} =    Convert Date    ${Expected_Payment_Date}    result_format=%Y%m%d
        ${VerifyDate}    Evaluate    ${date}<${future_date}
        IF    "${VerifyDate}" == 'True'
               Log to console     Validated Date
        ELSE
                Fail     Please give future date and make sure format should be YYYY-MM-DD
        END

Wait for page to be loaded
        Sleep    10s


Negative Zero Insert Payment Details into Request Page
        Wait Until Page Contains Element     ${Currency_Amount}   timeout=${GlobalTimeout}
        Wait for page to be loaded
        Click Element       ${Select_Company}
        Page should contain    ${Company_Name}
        Click Element       ${Company_name_Selector}
        Input Text          ${Currency_Amount}        ${Zero_Value}
        Wait Until Page Contains Element     ${Preffered_Payment_Account}   timeout=${GlobalTimeout}
        Click Element       ${Preffered_Payment_Account}
        Click Element       ${Select_Payment_Account}
        Input Text          ${Input_Date}        ${Expected_Payment_Date}
        Wait for page to be loaded
        Click Button        ${Continue_Payment_Details}
        Page should contain     ${Zero_Value_Error}
        Capture Page Screenshot        Error_Data.png
        Click Button       ${Pop_Up_Close}

Negative Field Insert Payment Details into Request Page

        Wait Until Page Contains Element     ${Currency_Amount}   timeout=${GlobalTimeout}
        Wait for page to be loaded
        Click Element       ${Select_Company}
        Page should contain    ${Company_Name}
        Click Element       ${Company_name_Selector}
        Input Text          ${Currency_Amount}        ${Amount}
        Wait Until Page Contains Element     ${Preffered_Payment_Account}   timeout=${GlobalTimeout}
        Click Element       ${Preffered_Payment_Account}
        Click Element       ${Select_Payment_Account}
        Wait for page to be loaded
        Click Button        ${Continue_Payment_Details}
#        ${res}    Run keyword and return status
        Page should contain     ${Due_Date}
        Capture Page Screenshot        One_Field_Data_Missing.png

Negative Multiple Field Insert Payment Details into Request Page

        Wait Until Page Contains Element     ${Currency_Amount}   timeout=${GlobalTimeout}
        Wait for page to be loaded
        Click Button        ${Continue_Payment_Details}
        Page should contain     ${Company_name_err}
        Page should contain     ${Amount_required}
        Page should contain     ${Credit_Account}
        Page should contain     ${Due_Date}
        Capture Page Screenshot        ALL_Field_Data_Missing.png

Open Payment Requests
        Capture Page Screenshot        BeforeOpeningPaymentRequests.png
        Wait Until Page Contains Element     ${Launch_Link}    timeout=${GlobalTimeout}
        Page Should Contain    Real-time Cross-border Payments
        Page Should Contain    Manage instant payments to and from Absa-verified companies.
        Page Should Contain    Requests
        Page Should Contain    View and submit instant payment requests to Absa-verified companies
        Click Link      ${Launch_Link}
        Capture Page Screenshot    Payment_Page_AfterLoad.png


Launch Real Time Crossborder Payments
    Wait Until Page Contains Element     ${Launch_Button}    timeout=${GlobalTimeout}
    Capture Page Screenshot   BeforeLaunch.png
    Page Should Contain    Hello, welcome to your Home page
    Page Should Contain    Real time cross border payments
    Page Should Contain    Initiate real time cross border transfers
    Capture Page Screenshot    AfterTextValidation.png
    Click Button    ${Launch_Button}