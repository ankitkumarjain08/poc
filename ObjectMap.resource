*** Settings ***

*** Variables ***
## Login Page ##
${Username_TextBox}    //input[@id='Username']
${Password_TextBox}    //input[@id='Password']
${Login_Button}        //button[@type='submit']
${Welcome_Logout}      Log out



## Post Login Launch pages ##
${Welcome_Path}        Hello, welcome to your Home page
${Launch_Button}       //button[text() = 'Launch']
${Launch_Link}         //a[text() = 'Launch']
${LoginLink}           //a[@class='btn btn-primary mb-3']
${Logout_Button}       //i[@class = 'masthead__icon ico icon-log-out']    # this button belongs to after submission
${ABSA_Access}         //a[text() = "Access"]

# Payment Request Overview Page ##
${Create_Request}     //button[@class = 'btn btn-primary']
${Main_Title}         //span[@class = 'jumbo__title']
${refresh_button}     //a[@href='javascript:void(0)']
${Date_of_request}    (//span[@class = 'card-header-label'])[1]
${request_to}         (//span[@class = 'card-header-label'])[2]
${Request_amount}     (//span[@class = 'card-header-label'])[3]
${Payment_Due}        (//span[@class = 'card-header-label'])[4]
${Payment_Status}     (//span[@class = 'card-header-label'])[5]
${sort_button}        (//i[@class = 'ico-sort'])[1]


## Request Payment Details Page ##
${Country_Disable}     (//div[@class= 'ng-input']//input[@type= 'text'])[1]
${Currency_Disable}    (//div[@class= 'ng-input']//input[@type= 'text'])[3]
${Company_Label_Name}     //label[text() = '${company_label}']
${Cancel}                //button[text() = 'Cancel']
${Amount_to_Receive}              //input[@name ='currencyAmount']
${Select_Company_Dropdown}               (//span[@class ='ng-arrow-wrapper'])[2]
${Company_name_Selector}        //span[text() ='${Company_Name}']
${Preffered_Payment_Account_Dropdown}    (//span[@class ='ng-arrow-wrapper'])[4]
${Select_Payment_Account}       //div[text() = ' ${Account_Name} ']
${Input_Date}                   //input[@id = 'dueDate']
${Continue_Payment_Details}    //button[@class='footer-primary btn btn-primary']


##Purpose of payment detail page

${BOp_Category_DropDown}     //span[@class = 'ng-arrow-wrapper']
${Search_Category}     //input[@role = 'combobox']
${Add_Category}       //span[text() = 'Bop Code: 285 | Study related services']      # this value needs to be updated according to input of BOP code
${Bop_category_SearchBox}    //div[@class = 'ng-input']//input[@type='text']
${Amount_Accounted_verifier}    (//span[text() = ' ${Verify_Amount}.00 '])[1]
${Amount_Accounted_verifier_2}    (//span[text() = ' ${Verify_Amount}.00 '])[2]

##File upload page
${BROWSE_BUTTON}       //span[@class ='link-fileupload']     #file selection button
${File_Selector}       //input[@class = 'file-selector']
${Spinner}              //div[contains(@class, 'solar-loader')]
${Loader}               //div[contains(@class, 'startup-center')]
${Trash_Box}            //span[@class ='upload-indicator--delete']

##Review details page
${Review_Details}       //h3[text() = 'Review details']
${country_verifier}     //div[text() = '${Country}']
${company_verifier}     //div[text() = '${Company_Name}']

${Preferred_payment_account}    (//div[@class = 'detail'])[4]
${date_of_expected_payment}    (//div[@class = 'detail'])[5]
${request_date}      (//div[@class = 'detail'])[6]
${invoice_button}    //button[@type = 'button']


#### summary after submission screen

${Submitted_Text}       //h1[text() ='Submitted']
${PPP_date}         (//div[@class = 'detail'])[1]
${PPP_amount}       (//div[@class = 'detail'])[2]
${PPP_country}      (//div[@class = 'detail'])[3]
${PPP_company}      (//div[@class = 'detail'])[4]
${PPP_preferred_payment_amount}     (//div[@class = 'detail'])[5]
${PPP_Due_Date}     (//div[@class = 'detail'])[6]
${PPP_BOP}     (//div[@class = 'detail'])[7]
${PPP_document}     (//div[@class = 'detail'])[4]
${PPP_backtoDB}    //button[@class = 'btn btn-secondary']     # DB means dashboard
${PPP_RequestAnotherPayment}     //button[@class = 'btn btn-primary']

# Negative Multiple Field Insert Payment Details into Request Page
${Due_Date}                     Due date is required
${Company_name_err}             Company is required
${Amount_required}              Amount is required
${Credit_Account}               Credit account is required
