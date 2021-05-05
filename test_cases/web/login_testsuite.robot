*** Settings ***
Documentation    As an user, I'd like to login the application succesfully
...    When the login got failure, I'd like to get the meaningfull inform in VN and EN

Resource    implementation/login_keywords.robot
Resource    implementation/target/login_page.robot
#Library     CSVLib


Test Teardown    Close all browsers

*** Variables ***
${LOGIN_DATA_FILE_PATH}    ${EXECDIR}\\test_cases\\web\\test_data\\LoginData.csv


*** Test Cases ***
Scenario: The Login with credentials should be successful
    [Documentation]    As the user, I'd like to login the HungThinhID successfully with my credentails
    [Tags]    Acceptance    Function    SmokeTest
    Given The LogIn page should be opened
    When I input Login userName    hongtest3@yopmail.com
     And I input Login password    Hongtest3@bcxy
     And I click button Dang Nhap
    Then Title should be  ${txt_prelogin_login}

#Scenario: The Login with credentials should be successful with multi-data
#    [Documentation]    As the user, I'd like to login the HungThinhiD successfully with my credentails
#    [Tags]    Accepance    Function    SmokeTest
#    ${login_test_data_list} Read CSV As List ${LOGIN_DATA_FILE_PATH}
#
#    FOR ${test_data} IN ${login_test_data_list}
#        ${username}         Get from list  ${test_data}  0
#        ${password}         Get from list  ${test_data}  1
#        Given The LogIn page should be opened
#        When I input Login userName  ${username}
#         And I input Login password  ${password}
#         And I click button Dang Nhap
#        Then Title should be  ${txt_prelogin_login}


#TC-10 [UI][Login][Email] - The Active User Can login the HungThinhID successfull with credential email
#    [Documentation]   As an user, I'd like to have meaningful feedback for my login failure
#     ...             The login failure should be identified unless the pair of username and password is valid
#     ...             The error messages should be displayed meaningfully
#     ...             VN "Tên đăng nhập hoặc Mật khẩu chưa chính xác. Vui lòng thử lại."
#     ...             The entered username should be fullfilled
#    [Tags]    Smoke    sit
#


#TC-914 [UI][Login][Email][VN] - Verify the error message when login failed by invalid email
#    [Documentation]  As an user, I'd like to have meaningful feedback for my login failure
#     ...             The login failure should be identified unless the pair of username and password is valid
#     ...             The error messages should be displayed meaningfully
#     ...             VN "Tên đăng nhập hoặc Mật khẩu chưa chính xác. Vui lòng thử lại."
#     ...             The entered username should be fullfilled
#    [Tags]  E2E Web
#    ${login_test_data_list}  Read CSV As List  ${LOGIN_DATA_PATH}  ;
#    FOR  ${test_data}  IN  @{test_data_list}
#        Given The Login page is opened
#            And The Language is Tieng Viet
#        When I input username ${email}
#            And I input password ${password}
#            And I click on the Login button
#        Then An error message should be displayed    ${error_message}
#            And The entered email should be fullfilled as    ${email}
#
#
#TC-915 [UI][Login][][VN] - Verify the error message when login failed by a wrong phone number
#    [Documentation]  As an user, I'd like to have meaningful feedback for my login failure
#     ...             The login failure should be identified unless the pair of username and password is valid
#     ...             The error messages should be in VN "Tên đăng nhập hoặc Mật khẩu chưa chính xác. Vui lòng thử lại."
#     ...             The entered username should be fullfilled
#    [Tags]  E2E Web
#    Given The Login page is opened
#        And The Language is Tieng Viet
#    When I input username ${phone_number}
#        And I input password ${password}
#        And I click on the Login button
#    Then An error message should be displayed ${error_message}
#        And The entered username should be fullfilled as ${phone_number}

