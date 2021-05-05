*** Settings ***
Documentation    As an user, I'd like to logout the webpage successfully

Resource    implementation/login_keywords.robot
Resource    implementation/target/login_page.robot

Test Teardown    Close all browsers

*** Test Cases ***
Scenario: The User can logout the application successfull
    [Documentation]    As the user, I'd like to logout the HungThinhID successfully
    [Tags]    Acceptance    Function    SmokeTest    Regression
    Given The LogIn page should be opened
     And I input Login userName  hongtest2@yopmail.com
     And I input Login password  Hongtest2@bcxy
     And I click button Dang Nhap
    When I click button Logout
    Then Title should be  ${txt_prelogin_login}