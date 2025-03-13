



*** Settings ***
Library     AppiumLibrary
Library     AppiumServerManager.py
Suite Setup     App setup
Suite Teardown  App teardown

*** Variables ***
${APPIUM_SERVER_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}        Android
#${DEVICE_NAME}          67692be2
${DEVICE_NAME}          192.168.1.90:5555
${APP}                  https://github.com/codenbox/Appium-Android-Project/blob/master/src/test/java/resources/General-Store.apk
#${APP_PACKAGE}          com.google.android.calculator
#${APP_ACTIVITY}         com.android.calculator2.Calculator
${AUTOMATION_NAME}      UiAutomator2
*** Test Cases ***
Launch application and verify application is loaded
    Wait Until Element Is Visible    accessibility_id=clear

Sum Test
    Wait Until Element Is Visible    accessibility_id=clear
    Click Element    accessibility_id=1
    Click Element    accessibility_id=plus
    Click Element    accessibility_id=2
    Click Element    accessibility_id=equals
    ${result}   Get Text    xpath=//android.widget.TextView[@resource-id="com.google.android.calculator:id/result_final"]
    Log    ${result}
    Element Text Should Be    xpath=//android.widget.TextView[@resource-id="com.google.android.calculator:id/result_final"]    3


Practice different locators on hybrid app on vendor
    Log    hybrid app on vendor

Practice different locators on web app on vendor
    Log    hybrid app on vendor

Practice different locators on native app on vendor
    Log    native app on vendor

Practice different locators on hybrid app on lcal
    Log    hybrid app on local

Practice different locators on web app on local
    Log    hybrid app on local

Practice different locators on native app on local
    Log    native app on local
    # id
    Click Element    id=com.google.android.calculator:id/digit_7

    # class name
    Click Element    class=android.widget.ImageView

    # xpath
    Click Element    xpath=//android.widget.ImageButton[@content-desc="7"]

    # android uiautomator selector
    Click Element    android=new UiSelector().resourceId("com.google.android.calculator:id/digit_7")

    Sleep    5s


Swiping the Drag Handle bar just a little to show the history bar
    ${rect}     Get Element Rect    //android.widget.ImageView[@resource-id="com.google.android.calculator:id/drag_handle_view"]
    Log    ${rect}[height]
    Log    ${rect}[width]
    Log    ${rect}[x]
    Log    ${rect}[y]
    ${end_y}        Evaluate    ${rect}[y]+100
    Flick    ${rect}[x]    ${rect}[y]    ${rect}[x]    ${end_y}
    Sleep    5s
    Capture Page Screenshot


Swiping the Drag Handle bar all the way to bottom
    ${height}     Get Window Height
    Log    ${height}
    ${rect}     Get Element Rect    //android.widget.ImageView[@resource-id="com.google.android.calculator:id/drag_handle_view"]
    Log    ${rect}[height]
    Log    ${rect}[width]
    Log    ${rect}[x]
    Log    ${rect}[y]
    ${end_y}        Evaluate    ${rect}[y]+200
    #Flick    ${rect}[x]    ${rect}[y]    ${rect}[x]    ${end_y}
    Swipe    ${rect}[x]    ${rect}[y]    ${rect}[x]    ${end_y}
    Sleep    3s

    ${rect}     Get Element Rect    //android.widget.ImageView[@resource-id="com.google.android.calculator:id/drag_handle_view"]
    Log    ${rect}[height]
    Log    ${rect}[width]
    Log    ${rect}[x]
    Log    ${rect}[y]
    ${end_y}        Evaluate    ${rect}[y]+500
    Swipe    ${rect}[x]    ${rect}[y]    ${rect}[x]    ${end_y}
    Sleep    5s
    Capture Page Screenshot



*** Keywords ***
App setup
    Start Appium Server
    Open Application    ${APPIUM_SERVER_URL}      platformName=${PLATFORM_NAME}         deviceName=${DEVICE_NAME}     app=${APP}        automationName=${AUTOMATION_NAME}

App teardown
    Close All Applications
    Stop Appium Server
