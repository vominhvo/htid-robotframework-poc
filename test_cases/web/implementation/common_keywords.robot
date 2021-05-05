*** Settings ***
Documentation   Define the common keywords for webpage check

Library         SeleniumLibrary  timeout=15s
Library         BuiltIn
Library         Collections
Library         String
Library         RequestsLibrary
Library         DateTime
Library         ../resources/libs/custom_library.py

*** Variables ***
${WEB_BROWSER}              chrome
${PRELOGIN_PAGE_URL}        https://ht-id-spa-demo.herokuapp.com
${MANAGEMENT_PAGE}          https://profile-dev.hungthinhcorp.com.vn


*** Keywords ***
I open the pre-Login homepage
  [Documentation]  Opens browser to homepage of HungThinhID and wait until login screen is visible
  ...              Browser and page address can be given as parameter. If empty, presets are used.
  Run Keyword If      '${WEB_BROWSER}' == 'HeadlessChrome'      Open Headless Chrome Browser and go to the webpage
  ...     ELSE     Initial webdriver and go to the webpage

Initial webdriver and go to the webpage
    [Arguments]  ${browser}=${WEB_BROWSER}  ${url}=${PRELOGIN_PAGE_URL}
    Set driver path for browser
    Open Browser                  ${url}    ${browser}    None
#    Set Selenium Speed            1
    Set Window Size               1600   1200
    Maximize Browser Window

Open Headless Chrome Browser and go to the webpage
    Set driver path for browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Create Webdriver    Chrome    chrome_options=${chrome_options}
#    Set Selenium Speed             1
    Set Window Size               1600   1200
    Go To    ${PRELOGIN_PAGE_URL}
#   Wait Until Element Is Visible    ${HOMEPAGE_TITLE}
#   Capture Page Screenshot

Click on element
    [Documentation]    Wait until element is visible then click button
    [Arguments]                      ${p_locator}
    Wait until element is visible    ${p_locator}
    Click element                    ${p_locator}

Set the textbox value
    [Documentation]    Input the value into the textbox
    [Arguments]  ${p_locator}   ${value}
    Wait until element is visible    ${p_locator}
    Input text   ${p_locator}   ${value}

