*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Library        DateTime
Resource       ../TestData/Data.robot
Resource      ../Resources/Keywords.robot
Suite Setup       Suite Setup
Suite Teardown        Suite Teardown
Test Setup       Previous Consideration


*** Variables ***
${Username}    KulipaSAUser3
${Password}    P@ssword123
${targeted_env}    uat    #Change according to the requirement uat / ppe


*** Test Cases ***
Launch RTCB
    [Documentation]
    [Tags]    rtcb-launch    rtcb-open-payment-request    test
    Launch Real Time Crossborder Payments

Open Payment Requests
    [Tags]    rtcb-open-payment-request    test
        Open Payment Requests

Create Payment Request  #TC_358275
    [Tags]    rtcb-create-payment-request    test
    Create Payment Request
    Insert Payment Details

Select Purpose of Payment
    [Tags]    rtcb-purpose-of-payment
    Transaction Reason and continue

Payment reference Document Upload  #TC_358276
    [Tags]      Payment reference Document Upload
        File Select and Upload

Payment Request Review #TC_358277
    [Tags]      Payment Request Review
        Payment Request Review

Payment Request Summary #TC_358279
    [Tags]      rtcb-Payment Request Summary
        Payment Request Summary