# This sample code supports Appium Robot client >=2
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with Robot
#
# Find keywords at: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
#
# If your tests fails saying 'did not match any elements' consider using 'wait activity' or
# 'wait until page contains element' before a click command

*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Test Cases ***
Test Case Name
    Open Application    http://127.0.0.1:4724
    ...     platformName=Android
    ...     appium:deviceName=67692be2
    ...     appium:automationName=UiAutomator2
    ...     appium:appPackage=com.swaglabsmobileapp
    ...     appium:appActivity=com.swaglabsmobileapp.MainActivity
    ...     chromedriverExecutable=${EXECDIR}/browserDriver/chromedriver.exe

    ## PERFORM LOGIN
    ${el2} =    Set Variable     accessibility_id=test-Username
    Wait Until Element Is Visible    ${el2}
    Input Text    ${el2}    standard_user
    ${el3} =    Set Variable     accessibility_id=test-Password
    Input Text    ${el3}    secret_sauce
    ${el4} =    Set Variable     android=new UiSelector().text("LOGIN")
    Click Element    ${el4}

    ## OPEN HAMBURGER MENU
    ${el5} =    Set Variable     android=new UiSelector().className("android.widget.ImageView").instance(1)
    Wait Until Element Is Visible    ${el5}
    Click Element    ${el5}

    ## CLICK ON WEBVIEW
    ${el6}      Set Variable    xpath=//android.widget.TextView[@text='WEBVIEW']
    Click Element    ${el6}

    ## LOAD THE WEB APP URL
    ${el6} =    Set Variable     accessibility_id=test-enter a https url here...
    Wait Until Element Is Visible    ${el6}
    Input Text    ${el6}    https://www.google.com
    ${el7} =    Set Variable     accessibility_id=test-GO TO SITE
    Click Element    ${el7}
    
    Toggle context

    ${el}   Set Variable    xpath=//textarea[@name='q']
    Wait Until Element Is Visible    ${el}
    Input Text    ${el}    AppiumLibrary documentation
    Sleep    2s
    
*** Keywords ***
Toggle context
    Sleep    5s
    ${curr_ctx}     Get Current Context
    Log    ${curr_ctx}
    ${all_ctx}     Get Contexts
    Log    ${all_ctx}

    FOR    ${ctx}    IN    @{all_ctx}
        IF    '${ctx}' != '${curr_ctx}'
            Switch To Context    ${ctx}
        END
    END
