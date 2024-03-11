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
${targeted_env}    ppe

*** Test Cases ***
TC_358274_Request Payments Detail

        Click on Launch Button

TC_358275_Purpose of Payment_BOP
        Negative Zero Insert Payment Details into Request Page

#
#TC_358276_Document Upload
#
#        File Select and Upload
#
#TC_358277_Payment Request Review
#
#        Payment Request Review
#
#TC_358279_Payment Request Summary
#        Payment Request Summary