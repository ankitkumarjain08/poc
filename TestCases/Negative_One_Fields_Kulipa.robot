*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Library        DateTime
Resource       ../TestData/Data.robot
Resource      ../Resources/Keywords.robot
Suite Setup       Suite Setup
Suite Teardown        Suite Teardown
#Test Teardown       Test Teardown


*** Variables ***
${Username}    KulipaSAUser1
${Password}    P@ssword123
${targeted_env}    uat    #Change according to the requirement uat / ppe

*** Test Cases ***
TC_358274_Request Payments Detail
        [Tags]    rtcb-launch    rtcb-open-payment-request
        Click on Launch Button

TC_358275_Purpose of Payment_BOP
        [Tags}    rtcb-launch    rtcb-leave-payment-request-field
        Negative Field Insert Payment Details into Request Page

#        Negative Multiple Field Insert Payment Details into Request Page