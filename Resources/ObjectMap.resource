*** Settings ***

*** Variables ***
## Login Page ##
${Username_TextBox}    //input[@id='Username']
${Password_TextBox}    //input[@id='Password']
${Login_Button}        //button[@type='submit']
${Welcome_Path}        Hello, welcome to your Home page
${Welcome_Logout}      Log out
## Post Login Launch pages ##
${Launch_Button}       //button[text() = 'Launch']
${Launch_Link}         //a[text() = 'Launch']
${LoginLink}           //a[@class='btn btn-primary mb-3']
${Logout_Button}      //i[@class = 'masthead__icon ico icon-log-out']    # this button belongs to after submission

${ABSA_Access}        //a[text() = "Access"]

## Request Page xpaths ##

${Create_Request}     //button[@class = 'btn btn-primary']

${Main_Title}    //span[@class = 'jumbo__title']
${refresh_button}    //a[@href='javascript:void(0)']
${Date_of_request}    (//span[@class = 'card-header-label'])[1]
${request_to}    (//span[@class = 'card-header-label'])[2]
${Request_amount}    (//span[@class = 'card-header-label'])[3]
${Payment_Due}    (//span[@class = 'card-header-label'])[4]
${Payment_Status}    (//span[@class = 'card-header-label'])[5]
${sort_button}    (//i[@class = 'ico-sort'])[1]
${Country_Disable}    (//div[@class= 'ng-input']//input[@type= 'text'])[1]
${Currency_Disable}    (//div[@class= 'ng-input']//input[@type= 'text'])[3]
${Company_Label_Name}     //label[text() = '${company_label}']
${Cancel}     //button[text() = 'Cancel']

${Currency_Amount}    //input[@name ='currencyAmount']
${Select_Company}     (//span[@class ='ng-arrow-wrapper'])[2]
${Company_name_Selector}       //span[text() ='${Company_Name}']
${Preffered_Payment_Account}    (//span[@class ='ng-arrow-wrapper'])[4]
${Select_Payment_Account}       //div[text() = ' ${Account_Name} ']
${Input_Date}     //input[@id = 'dueDate']
${Continue_Payment_Details}    //button[@class='footer-primary btn btn-primary']
${Select_Category}     //span[@class = 'ng-arrow-wrapper']
${Search_Category}     //input[@role = 'combobox']
${Add_Category}     //span[text() = 'Bop Code: 285 | Study related services']
${BROWSE_BUTTON}       //span[@class ='link-fileupload']     #file selection button
${File_Selector}     //input[@class = 'file-selector']
${Zero_Value_Error}    Request could not be processed
${Pop_Up_Close}     //button[text() = 'Close']
${Spinner}          //div[contains(@class, 'solar-loader')]
${Loader}           //div[contains(@class, 'startup-center')]
${Trash_Box}       //span[@class ='upload-indicator--delete']
${Submitted_Text}      //h1[text() ='Submitted']
${Review_Details}     //h3[text() = 'Review details']

${Due_Date}     Due date is required
${Company_name_err}    Company is required
${Amount_required}    Amount is required
${Credit_Account}    Credit account is required



