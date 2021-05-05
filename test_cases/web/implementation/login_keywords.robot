*** Settings ***
Documentation   Login keywords definition used for creating Login test cases

Resource        common_keywords.robot
Resource        target/login_page.robot
Library         BuiltIn
Library         SeleniumLibrary
Library         String

*** Keywords ***
The LogIn page should be opened
    I open the pre-Login homepage
    Click element   ${btn_prelogin_login}

I input Login Username
    [Arguments]    ${p_value}
    Set the textbox value    ${txt_username_login}    ${p_value}

I input Login Password
    [Arguments]    ${p_value}
    Set the textbox value    ${txt_password_login}    ${p_value}

I click button Dang Nhap
    Click on element    ${btn_dangnhap_login}

I click button Logout
    Click on element    ${btn__logout_login}