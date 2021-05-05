*** Settings ***
Documentation    Suite description
Library    AppiumLibrary

*** Variables ***

${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}  Android
${PLATFROM_VER}   11.0
${UDID}           emulator-5554
${DEVICE_NAME}    sdk_gphone_x86_arm
${APP_PACKAGE}    com.org.hungthinhcorp.id.mobilepoc
${APP_ACTIVITY}   com.org.hungthinhcorp.id.mobilepoc.MainActivity

${CAL_PACKAGE}    com.google.android.calculator
${CAL_ACTIVITY}   com.android.calculator2.Calculator

*** Test Cases ***
First Test cases
    [Documentation]    Start Calculator and do a calculation 6 + 4 = 10
    [Tags]    Mobile
    Open Calculator Application
    Click Element    xpath=//android.widget.Button[contains(@text,'6')]
    Click Element    xpath=//android.widget.Button[contains(@text,'+')]
    Click Element    xpath=//android.widget.Button[contains(@text,'4')]
    Click Element    xpath=//android.widget.Button[contains(@text,'=')]
    should be equal as strings    10


#Scenario: HungThinh Mobile Test On Android
#    [Tags]    mobile
#    Open Hung Thinh Application
#    Launch application
#    Quit application

*** Keywords ***
Open Calculator Application
    [Documentation]    Start Calculator on android mobile
     Open Application   ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFROM_VER}
    ...    deviceName=${UDID}
    ...    newCommandTimeout=2500
    ...    appActivity=${CAL_ACTIVITY}
    ...    appPackage=${CAL_PACKAGE}

Open Hung Thinh Application
    [Documentation]    Start Appinium session of the application
    Open Application    ${REMOTE_URL}    udid=${UDID}
    ...    platformName=${PLATFORM_NAME}  platformVersion=${PLATFROM_VER}
    ...    deviceName=${UDID}   appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}


#
#variables:
#  EXCLUDE_TAG_1: 'manual'
#  TEST_SUITE_1: 'test_cases/web/*.robot'
#
#trigger:
#- main
#
#pool:
#  vmImage: ubuntu-latest
#
#steps:
#- script:
#    $env:UserName
#    python main.py -s $(TEST_SUITE_1) -e $(EXCLUDE_TAG_1)
#  displayName: 'Run a one-line script'
