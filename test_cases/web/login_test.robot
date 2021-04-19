*** Settings ***
Documentation    As an user, I'd like to login the application succesfully
...             When the login got failure, I'd like to get the meaningfull inform in VN and EN

Resource         ./implementation/login_test_keywords.robot
Library          sources/libs/custom_library.py
Library          BuiltIn
Library          SeleniumLibrary
Library          OperatingSystem

Test Setup       I open the HungThinhID homepage
Test Teardown    Close all browsers


*** Test Cases ***
Scenario: TC-10 [UI][Login][Email] - The Active User Can login the HungThinhID successfull with credential email
    [Documentation]    As an active user, I'd like to login the HungThinhID succecfull
    ...              with the credential is my email
    [Tags]    Smoke    sit
    Given I open the Login page
    When I wait until element visible and click button    ${login_button_id}
    Then The page displayed should be ${login_page_title}


Scenario Outline: TC-914 [UI][Login][Email][VN] - Verify the error message when login failed by invalid email
    [Documentation]  As an user, I'd like to have meaningful feedback for my login failure
     ...             The login failure should be identified unless the pair of username and password is valid
     ...             The error messages should be displayed meaningfully
     ...             VN "Tên đăng nhập hoặc Mật khẩu chưa chính xác. Vui lòng thử lại."
     ...             The entered username should be fullfilled
    [Tags]  E2E Web
    ${login_test_data_list}  Read CSV As List  ${LOGIN_DATA_PATH}  ;
    FOR  ${test_data}  IN  @{test_data_list}
        Given The Login page is opened
            And The Language is Tieng Viet
        When I input username ${email}
            And I input password ${password}
            And I click on the Login button
        Then An error message should be displayed ${error_message}
            And The entered email should be fullfilled as ${email}

Scenario Outline: TC-915 [UI][Login][][VN] - Verify the error message when login failed by a wrong phone number
    [Documentation]  As an user, I'd like to have meaningful feedback for my login failure
     ...             The login failure should be identified unless the pair of username and password is valid
     ...             The error messages should be in VN "Tên đăng nhập hoặc Mật khẩu chưa chính xác. Vui lòng thử lại."
     ...             The entered username should be fullfilled
    [Tags]  E2E Web
    Given The Login page is opened
        And The Language is Tieng Viet
    When I input username ${phone_number}
        And I input password ${password}
        And I click on the Login button
    Then An error message should be displayed ${error_message}
        And The entered username should be fullfilled as ${phone_number}