*** Settings ***
Library    AppiumLibrary
Library     AppiumServerManagerDemo.py

*** Variables ***
${PORT}             4724
${appiumServerUrl}  http://127.0.0.1:${PORT}
${platformName}     Android
${deviceName}        67692be2
${appPackage}       com.the511plus.MultiTouchTester
${appActivity}      com.the511plus.MultiTouchTester.MultiTouchTester
${automationName}   UiAutomator2


*** Test Cases ***
Multi-Touch Example
    Start Appium Service    ${PORT}
    Open Application    ${APPIUM_SERVER_URL}      platformName=${PLATFORM_NAME}         deviceName=${DEVICE_NAME}     appPackage=${appPackage}      appActivity=${appActivity}        automationName=${AUTOMATION_NAME}
    Sleep    3s
    Close All Applications
    Stop Appium Service
