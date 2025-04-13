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


Verify Multiply operation on Google Calculator
    Wait Until Element Is Visible    accessibility_id=clear
    Click Element    id=com.google.android.calculator:id/digit_7
    Click Element    accessibility_id=multiply
    Click Element    xpath=//android.widget.ImageButton[@content-desc="5"]
    Click Element    android=new UiSelector().resourceId("com.google.android.calculator:id/eq")
    Element Text Should Be    xpath=//android.widget.TextView[@resource-id="com.google.android.calculator:id/result_final"]    35

Verify History View
    Wait Until Element Is Visible    accessibility_id=clear
    ${rect}     Get Element Rect    id=com.google.android.calculator:id/drag_handle_view
    Log    ${rect}
    Log    ${rect}[x]
    Log    ${rect}[y]
    ${offset_y}     Evaluate    ${rect}[y]+200
    Capture Page Screenshot
    Swipe    ${rect}[x]    ${rect}[y]    ${rect}[x]    ${offset_y}      duration=1000
    Capture Page Screenshot
    #Sleep    2s
    Wait Until Element Is Visible    id=com.google.android.calculator:id/current_expression_header
    ${rect}     Get Element Rect    id=com.google.android.calculator:id/drag_handle_view
    ${offset_y}     Evaluate    ${rect}[y]+500
    Swipe    ${rect}[x]    ${rect}[y]    ${rect}[x]    ${offset_y}      duration=1000
#    ${height}   Get Window Height
#    ${offset_y}     Evaluate    ${height}-500
#    Log    ${height}
#    Swipe    ${rect}[x]    ${rect}[y]    ${rect}[x]    ${offset_y}      duration=1000
    Wait Until Element Is Visible    android=new UiSelector().text("History")



Locators Demo
    Wait Until Element Is Visible    accessibility_id=clear

    # id locator
    Click Element    id=com.google.android.calculator:id/digit_7

    # accessibility id
    Click Element    accessibility_id=multiply

    # xpath
    Click Element    xpath=//android.widget.ImageButton[@content-desc="5"]

    # UI Automator Selector
    Click Element    android=new UiSelector().resourceId("com.google.android.calculator:id/eq")

    Sleep    2s

    # class
    Click Element    class=android.widget.ImageView

    Sleep    3s

*** Keywords ***
Setup App
     Open Application    ${appiumServerUrl}      platformName=${platformName}         deviceName=${deviceName}     appPackage=${appPackage}     appActivity=${appActivity}        automationName=${automationName}

Teardown App
    Close All Applications


