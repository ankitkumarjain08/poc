*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Library        DateTime
Resource       ../TestData/Data.robot
Resource      ../Resources/Keywords.robot
#Library       RPA.Browser.Selenium
Suite Setup       Suite Setup
Suite Teardown        Suite Teardown



*** Variables ***
${Username}    KulipaSAUser3
${Password}    P@ssword123
${targeted_env}    uat    #Change according to the requirement uat / ppe


*** Test Cases ***
First Launch Screen Validator

    Page should contain       Hello, welcome to your Home page         timeout=20s    #${Welcome_Path}
    Wait Until Page Contains Element       //i[@class = 'masthead__icon ico icon-speech-conversation']    #xpath of chat box
    Page should contain       Complaints    #xpath of complaint box
    Wait Until Page Contains Element       //i[@class = 'masthead__icon ico icon-email']    #xpath of Message box symbol
    Page should contain       Messages    #xpath of messages
    Wait Until Page Contains Element       //Li[@class = 'dropdown-icon dropdown']    #Profile
    Click Element       //span[ text()= 'Complaints']
    Wait for page to be loaded
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[1]
    Run keyword and continue on failure    Page should contain       403 Forbidden     #for us it is forbidden with 403    errror
    Capture Page Screenshot        Complaints_Tab.png
    Switch Window    ${handles}[0]
    Wait Until Page Contains Element       //i[@class = 'masthead__icon ico icon-email']    #xpath of mail box symbol
    Page should contain       Messages    #xpath of messages
    Wait Until Page Contains Element       //Li[@class = 'dropdown-icon dropdown']    #Profile
    Click Element       //i[@class = 'masthead__icon ico icon-email']
    Wait for page to be loaded
    Capture Page Screenshot        EMails_Tab.png
    Click Element       ${ABSA_Access}
    Wait for page to be loaded
#    sleep    10s
    Page should contain       Hello, welcome to your Home page
    Log to console    Verfied "Hello, welcome to your Home page"
    Log to console    Verified "Explore your available products" Text
    Page should contain    Real time cross border payments
    Log to console    Verified "Real time cross border payments"
    Page should contain     Initiate real time cross border transfers.
    Log to console    Verified "Real time cross border transfers"
    Capture Page Screenshot        Return_From_EMail.png
    Wait Until Page Contains Element       //div[@class = 'dropdown-toggle masthead__wrapper']    #Profile
    Mouse Over    //span[@class= 'icon-chevron-down']
    sleep    2s
    Capture Page Screenshot        Profile.png
    Wait for page to be loaded
    Wait Until Page Contains Element       ${Logout_Button}


