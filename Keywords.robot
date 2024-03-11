*** Settings ***
Library    ../../venv/Lib/site-packages/SeleniumLibrary/__init__.py
Library    ../../venv/Lib/site-packages/robot/libraries/OperatingSystem.py
*** Keywords ***
Suite Setup
        Set Screenshot Directory    ../Output/Screenshots
        Move Files    ../Output/Screenshots/*.png    ../Output/Before_Test_Logs/
        Move Files    ../Output/Logs/*.html    ../Output/Before_Test_Logs/
        Log to console    Old reports and screenshots were moved. Starting test case now
        Login_Setup    ${Username}    ${Password}    ${targeted_env}

#Previous Consideration
         #SKIP IF        '${PREV TEST STATUS}'=='FAIL' or '${PREV TEST STATUS}'=='SKIP'  Previous test has been failed

Login_Setup
        [Arguments]    ${Username}     ${Password}    ${targeted_env}
        Set Global Variable    ${GlobalTimeout}     20s
        # Verify Future Date
        Open Browser        https://auth.${targeted_env}.absaaccess.africa/         chrome
        Maximize Browser Window
        Wait Until Page Contains    Welcome to Absa Access     timeout=${GlobalTimeout}
        Element Should Be Enabled        //a[@class = 'sol-branding__logo']
        Set Window Size    1920    1080     # this is a mandatory as ${Preffered_Payment_Account_Dropdown} will not come to screen don't delete
        Wait Until Page Contains Element    ${LoginLink}    timeout=${GlobalTimeout}
        Click Link    ${LoginLink}
#        Execute Javascript    document.body.style.zoom = "0.8"
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
        Page should contain    Explore your available products
        Page Should Contain    Real time cross border payments
        Page Should Contain    Initiate real time cross border transfers
        Element Should Be Enabled      ${Launch_Button}
        Run Keyword And Continue On Failure    Run Keyword And Ignore Error    Page should contain       ${Welcome_Logout}    timeout=${GlobalTimeout}
        Capture Page Screenshot        Login_Page.
        
Click on Launch Button
        [Documentation]    Usage exists on negative scenarios please don't touch

        Wait Until Page Contains Element     ${Launch_Button}    timeout=${GlobalTimeout}
        Click Button    ${Launch_Button}
        
#        Element Text Should Be     //h2[text() = 'Cross-border payment requests']     Cross-border payment requests
        Wait Until Page Contains Element     ${Launch_Link}    timeout=${GlobalTimeout}
        Click Link      ${Launch_Link}
        Verify Page is loaded and continue
        Capture Page Screenshot        Dashboard_HomePage.png

Launch Real Time Crossborder Payments

        Wait Until Page Contains Element     ${Launch_Button}    timeout=${GlobalTimeout}
        Page Should Contain    Hello, welcome to your Home page
        Page Should Contain    Real time cross border payments
        Page Should Contain    Initiate real time cross border transfers
        Capture Page Screenshot    RTCB_Launch_Homepage.png
        Element Should Be Enabled      ${Launch_Button}
        Click Button    ${Launch_Button}

Open Payment Requests
        Capture Page Screenshot        Request_Launch.png
        Wait Until Page Contains Element     ${Launch_Link}    timeout=${GlobalTimeout}
        Page Should Contain    Real-time Cross-border Payments
        Page Should Contain    Manage instant payments to and from Absa-verified companies.
        Page Should Contain    Requests
        Page Should Contain    View and submit instant payment requests to Absa-verified companies
        Element Should Be Enabled      ${Launch_Link}
        Click Link      ${Launch_Link}


Payment Request History Page
        Wait Until Page Contains Element     ${Create_Request}    timeout=${GlobalTimeout}
        Page should contain element     ${Main_Title}
        Element Should Be Enabled       ${Main_Title}
        Run keyword and continue on failure  Page Should Contain       Request history
        Page Should Contain Element   ${refresh_button}
        Element Should Be Enabled     ${refresh_button}
        Click Element     ${refresh_button}
        Run keyword and continue on failure  Wait Until Page Contains Element    ${Spinner}
        Run keyword and continue on failure  Wait Until Page Does Not Contain Element    ${Spinner}
        Run keyword and continue on failure  Page should contain element    ${refresh_button}
        Run keyword and continue on failure  Page should contain element    ${Date_of_request}
        Run keyword and continue on failure  Page should contain element    ${request_to}
        Run keyword and continue on failure  Page should contain element    ${Request_amount}
        Run keyword and continue on failure  Page should contain element    ${Payment_Due}
        Run keyword and continue on failure  Page should contain element    ${Payment_Status}
        Page should contain element     ${sort_button}
        Element Should Be Enabled       ${sort_button}


Insert Payment Details
        Wait Until Element Is Visible    ${Amount_to_Receive}      timeout=${GlobalTimeout}
        Capture Page Screenshot     payment_details_start.png

        Page Should Contain    Payment details
        Page Should Contain    Country
        Page Should Contain    ABSA verified company
        Page Should Contain    Amount you want to receive
        Page Should Contain    Preferred payment account
        Page Should Contain    Currency
        Page Should Contain    Expected payment date

        Element Should Be Disabled     ${Country_Disable}
        Element Should Be Disabled     ${Currency_Disable}
        Element Should Be Enabled      ${Select_Company_Dropdown}
        Element Should Be Enabled      ${Preffered_Payment_Account_Dropdown}
        Element Should Be Enabled      ${Amount_to_Receive}
        Element Should Be Enabled      ${Input_Date}

        Element Should Be Enabled      ${Select_Company_Dropdown}        

        Click Element              ${Select_Company_Dropdown}
        Element Text Should Be     ${Company_Label_Name}    ${company_label}
        #Sleep    2s
        Element Should Be Enabled      ${Company_name_Selector}        
        Click Element       ${Company_name_Selector}
        Input Text          ${Amount_to_Receive}        ${Amount}
        ${Entered_Amount}    Run keyword and continue on failure    Get Value     ${Amount_to_Receive}
        Should be Equal     ${Entered_Amount}   ${Amount}
        Wait Until Page Contains Element     ${Preffered_Payment_Account_Dropdown}   timeout=${GlobalTimeout}    # Mandatory element verification please don't remove this
        Element Should Be Enabled      ${Preffered_Payment_Account_Dropdown}        
        Click Element       ${Preffered_Payment_Account_Dropdown}
        Element Should Be Enabled      ${Select_Payment_Account}
        Click Element       ${Select_Payment_Account}
        Input Text          ${Input_Date}        ${Expected_Payment_Date}
        ${Date_store}    Run keyword and continue on failure    Get Value     ${Input_Date}
        Should be Equal     ${Date_store}   ${Expected_Payment_Date}
        Capture Page Screenshot     Payment_Details_Entered.png
        
        Element Should Be Enabled      ${Continue_Payment_Details}
        Click Button        ${Continue_Payment_Details}
        Wait Until Page Contains Element     ${BOp_Category_DropDown}    timeout=${GlobalTimeout}
        #Wait for page to be loaded       # Mandatory wait can't pass dynamic here
        Page should contain element     ${Cancel}

Transaction Reason and continue
        Capture Page Screenshot        Blank_Transaction_Reason.png
        Run keyword and continue on failure  Page Should Contain    Request a payment
        Run keyword and continue on failure  Page Should Contain    Capture the information step-by-step
        Run keyword and continue on failure  Page Should Contain    Purpose of payment
        Run keyword and continue on failure  Page Should Contain    Exchange control Reason
        Run keyword and continue on failure  Page Should Contain    Amount accounted for
        Run keyword and continue on failure  Page Should Contain    Payment details
        Run keyword and continue on failure  Page Should Contain    Document upload
        Run keyword and continue on failure  Page Should Contain    Confirmation


        Input Text        ${Search_Category}       ${Transaction_Reason}
        Click Element     ${Add_Category}
        Page Should Contain Element     ${Add_Category}
        Capture Page Screenshot        Bopcategory_selected.png
        Page should contain element      ${Amount_Accounted_verifier}
        ${Get_amount}     Get Text    ${Amount_Accounted_verifier}
        ${Get_amount_2}     Get Text    ${Amount_Accounted_verifier_2}
        Should be equal     ${Get_amount}     ${Get_amount_2}
        Page should contain    ${Get_amount}
        Page should contain    ${Get_amount_2}
        Page should contain element      ${Bop_category_SearchBox}
        Page should contain element      ${Continue_Payment_Details}
        Click Button        ${Continue_Payment_Details}

File Select and Upload
        Wait Until Page Contains Element     ${File_Selector}    timeout=${GlobalTimeout}
        Page Should Contain Element     ${File_Selector}    #without waiting we can expect page to have text
        Page Should Contain    Document upload
        Page Should Contain    Drag and drop upload or choose a file
        Page Should Contain    Maximum file size 5 MB per document | Only PDF, JPEG, JPG, PNG, TIFF, BMP files are supported
        Choose File     ${File_Selector}    ${FILE_PATH}
        sleep           ${File_upload_time}
        Click Button    ${Continue_Payment_Details}      # CONTINUE button
      
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
          #Wait for page to be loaded
        ${country_fetch}    Get Text    ${country_verifier}
        Should be equal     ${Country}    ${country_fetch}
        Page should contain    ${Country}
        Element should be enabled       ${Preferred_payment_account}
        Element should be enabled       ${date_of_expected_payment}
        Element should be enabled       ${request_date}
        Element should be enabled       ${invoice_button}
        Capture Page Screenshot        Payment_Review.png
Submit Payment Request
        Wait Until Page Contains Element     ${Continue_Payment_Details}    timeout=${GlobalTimeout}
        Click Button    ${Continue_Payment_Details}     #submit button
       
        #Page should contain element     ${Submitted_Text}
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
        Page should contain element     ${PPP_date}
        Page should contain element    ${PPP_amount}
        Page should contain element     ${PPP_country}
        Page should contain element     ${PPP_company}
        Page should contain element     ${PPP_preferred_payment_amount}
        Page should contain element    ${PPP_Due_Date}
        Page should contain element     ${PPP_BOP}
        Page should contain element     ${PPP_document}
        Page should contain element     ${PPP_backtoDB}
        Page should contain element     ${PPP_RequestAnotherPayment}

#Verify Future Date
        #Log to console      Validating Date...
        #${current_date}=    Get Current Date
        #${date} =    Convert Date    ${current_date}    result_format=%Y%m%d
        #Set Suite Variable    ${date}    ${date}
        #${future_date} =    Convert Date    ${Expected_Payment_Date}    result_format=%Y%m%d
        #${VerifyDate}    Evaluate    ${date}<${future_date}
        #IF    "${VerifyDate}" == 'True'
               #Log to console     Validated Date
        #ELSE
                #Fail     Please give future date and make sure format should be YYYY-MM-DD
        #END

#Wait for page to be loaded
        #Sleep    10s


#*Negative Zero Insert Payment Details into Request Page
        Wait Until Page Contains Element     ${Amount_to_Receive}   timeout=${GlobalTimeout}
        
        Click Element       ${Select_Company_Dropdown}
        Page should contain    ${Company_Name}
        Click Element       ${Company_name_Selector}
        Input Text          ${Amount_to_Receive}        ${Zero_Value}
        Wait Until Page Contains Element     ${Preffered_Payment_Account_Dropdown}   timeout=${GlobalTimeout}
        Click Element       ${Preffered_Payment_Account_Dropdown}
        Click Element       ${Select_Payment_Account}
        Input Text          ${Input_Date}        ${Expected_Payment_Date}
        
        Click Button        ${Continue_Payment_Details}
        Page should contain     ${Zero_Value_Error}
        Capture Page Screenshot        Error_Data.png
        Click Button       ${Pop_Up_Close}

Negative Field Insert Payment Details into Request Page

        Wait Until Page Contains Element     ${Amount_to_Receive}   timeout=${GlobalTimeout}
       
        Click Element       ${Select_Company_Dropdown}
        Page should contain    ${Company_Name}
        Click Element       ${Company_name_Selector}
        Input Text          ${Amount_to_Receive}        ${Amount}
        Wait Until Page Contains Element     ${Preffered_Payment_Account_Dropdown}   timeout=${GlobalTimeout}
        Click Element       ${Preffered_Payment_Account_Dropdown}
        Click Element       ${Select_Payment_Account}
        
        Click Button        ${Continue_Payment_Details}
#        ${res}    Run keyword and return status
        Page should contain     ${Due_Date}
        Capture Page Screenshot        One_Field_Data_Missing.png

Negative Multiple Field Insert Payment Details into Request Page

        Wait Until Page Contains Element     ${Amount_to_Receive}   timeout=${GlobalTimeout}
        W
        Click Button        ${Continue_Payment_Details}
        Page should contain     ${Company_name_err}
        Page should contain     ${Amount_required}
        Page should contain     ${Credit_Account}
        Page should contain     ${Due_Date}
        Capture Page Screenshot        ALL_Field_Data_Missing.png


Suite Teardown
        Run Keyword And Continue On Failure    Run Keyword And Ignore Error    Click Element        ${Logout_Button}
        Sleep    5s
