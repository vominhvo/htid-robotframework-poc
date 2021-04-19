*** Settings ***
Documentation   Define the common keywords for webpage check

Library        ../sources/libs/custom_library.py
Library         SeleniumLibrary  15s
Library         BuiltIn
Library         Collections
Library         String
Library         RequestsLibrary
Library         DateTime

*** Variables ***
${WEB_BROWSER}
${HOMEPAGE_URL}     https://profile-dev.hungthinhcorp.com.vn
${HOMEPAGE_TITLE}   Hung Thinh ID - Home

*** Keywords ***
I open the HungThinhID homepage
  [Documentation]  Opens browser to homepage of HungThinhID and wait until login screen is visible
  ...              Browser and page address can be given as parameter. If empty, presets are used.
  Run Keyword If      '${WEB_BROWSER}' == 'HeadlessChrome'      Open Headless Chrome Browser to Page
  ...     ELSE     Open the HungThinhID homepage

Open the HungThinhID homepage
    [Arguments]  ${browser}=${WEB_BROWSER}  ${url}=${HOMEPAGE_URL}
    Set driver path for browser
    Open Browser                  ${url}    ${browser}    None
    Set Selenium Speed            .5
    Set Window Size               1600   1200
    Maximize Browser Window
    Sleep                         2

#Open Headless Chrome Browser to Page
#    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
#    Call Method    ${chrome_options}    add_argument    test-type
#    Call Method    ${chrome_options}    add_argument    --disable-extensions
#    Call Method    ${chrome_options}    add_argument    --headless
#    Call Method    ${chrome_options}    add_argument    --disable-gpu
#    Call Method    ${chrome_options}    add_argument    --no-sandbox
#    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
#    Create Webdriver    Chrome    chrome_options=${chrome_options}
#    Set Selenium Speed               .5
#    Set Window Size     1600     1200
#    Go To    ${HOMEPAGE_URL}
#    Wait Until Element Is Visible    ${HUNGTHINH_PAGE_ID}
#    Capture Page Screenshot

I wait until element visible and click button
    [Documentation]    Wait until element is visible then click button
    [Arguments]                      ${locator}
    Wait Until Element Is Visible    ${locator}    15s
    Click Button                     ${locator}

