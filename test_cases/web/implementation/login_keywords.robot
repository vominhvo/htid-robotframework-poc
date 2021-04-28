*** Settings ***
Documentation   Login keywords definition used for creating Login test cases

Resource        common_keywords.robot
Resource        target/login_page.robot
Library         BuiltIn
Library         SeleniumLibrary
Library         String

*** Keywords ***
The Login page is opened
    I open the HungThinhID homepage
    I wait until element visible and click button   ${LOGIN_BUTTON_ID}
    Sleep    2

I login the HungThinhID successfully
    [Arguments]    ${username_value}    ${password_value}
    Input text       ${USERNAME_ID}        ${username_value}
    Input text       ${PASSWORD_ID}        ${password_value}
    Click element    ${DANGNHAP_BUTTON_ID}

I logout the HungThinhID succesfully
    I wait until element visible and click button   ${LOGOUT_BUTTON_ID}