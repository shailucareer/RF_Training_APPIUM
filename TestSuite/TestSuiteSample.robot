

*** Settings ***
Library     AppiumLibrary


*** Test Cases ***
Make connection with Emulator
    Log    Hello
    Open Application    http://127.0.0.1:4723      platformName=Android         deviceName=192.168.1.90:5555     appPackage=com.google.android.calculator     appActivity=com.android.calculator2.Calculator        automationName=UiAutomator2
    #Open Application    http://192.168.1.6:4723      platformName=Android         deviceName=R3CT809M6FN     appPackage=com.google.android.calculator     appActivity=com.android.calculator2.Calculator        automationName=UiAutomator2
    #Open Application     http://127.0.0.1:4723      platformName=Android      deviceName=67692be2     appPackage=chat21.android.demo     appActivity=chat21.android.demo.SplashActivity     automationName=UiAutomator2
    Sleep    5s
    Close All Applications