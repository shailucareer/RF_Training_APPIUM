*** Settings ***
Library    AppiumLibrary
Library    ../appium_server_start_stop_python/AppiumServerManagerDemo.py
Library     PythonActionPerform.py
Test Setup      Appium Setup
Test Teardown   Appium Teardown

*** Variables ***
${APPIUM_DRIVER}    ${None}
${PORT}             4724
${appiumServerUrl}  http://127.0.0.1:${PORT}
${platformName}     Android
${deviceName}        67692be2
${appPackage}       com.the511plus.MultiTouchTester
${appActivity}      com.the511plus.MultiTouchTester.MultiTouchTester
${automationName}   UiAutomator2

*** Keywords ***
Appium Setup
    Start Appium Service    ${PORT}
    Open Application    ${APPIUM_SERVER_URL}      platformName=${PLATFORM_NAME}         deviceName=${DEVICE_NAME}     appPackage=${appPackage}      appActivity=${appActivity}        automationName=${AUTOMATION_NAME}
    ${driver}=    Get Library Instance    AppiumLibrary
    ${appium_driver}=    Call Method    ${driver}    _current_application
    Set Global Variable    ${APPIUM_DRIVER}     ${appium_driver}
    Sleep    3s

Appium Teardown
    Close All Applications
    Stop Appium Service


*** Test Cases ***
Sharing the Appium Driver Object with Python Code and Run some action via python
    Click Using Python    ${APPIUM_DRIVER}    //android.widget.Button[@resource-id="android:id/button1"]
    Sleep    3s
