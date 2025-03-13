*** Settings ***
Library    AppiumLibrary
Suite Setup     Setup App
Suite Teardown  Teardown App

*** Variables ***
${appiumServerUrl}  http://127.0.0.1:4723
${platformName}     Android
${deviceName}       192.168.1.90:5555
${appPackage}       com.google.android.calculator
${appActivity}      com.android.calculator2.Calculator
${automationName}   UiAutomator2

*** Test Cases ***
Verify Add operation on Google Calculator
    Wait Until Element Is Visible    accessibility_id=clear
    Click Element    accessibility_id=1
    Click Element    accessibility_id=plus
    Click Element    accessibility_id=2
    Click Element    accessibility_id=equals
    Element Text Should Be    xpath=//android.widget.TextView[@resource-id="com.google.android.calculator:id/result_final"]    3


*** Keywords ***
Setup App
     Open Application    ${appiumServerUrl}      platformName=${platformName}         deviceName=${deviceName}     appPackage=${appPackage}     appActivity=${appActivity}        automationName=${automationName}

Teardown App
    Close All Applications


