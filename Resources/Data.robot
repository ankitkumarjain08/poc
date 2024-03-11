*** Settings ***
Resource      ../Resources/ObjectMap.resource

#check
*** Variables ***
## Login test data ###

${CHROME PATH}        ../ChromeDriver/chromedriver.exe    #//span[text() = 'choose a file']
${OUTPUT DIR}         .//Surendra_output
${FILE_PATH}            ${CURDIR}\\DocumentUpload\\cat3.JPG
${Login_Message}        "################################## Login Successful ############################################"
## Launch Page after login ##
## Request Payment Dashboard or home page ##
#${timed_out}        15s     # Not using default timeout will be global timeout of 20s which wait for 1sec to 20sec
${Company_Name}     A&K GLOBAL HEALTH KENYA LIMITED
${Amount}           9341
${Account_Name}     KELLY MARINE CC ZAR 4044179534
${Expected_Payment_Date}    2024-02-19    #format should be YYYY-MM-DD
${Transaction_Reason}    285
${File_upload_time}    30s
${company_label}    ABSA verified company

## Negative Scenarios Data ##
${Zero_Value}    0


