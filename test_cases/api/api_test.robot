*** Settings ***
Documentation    API testing

Library    RequestsLibrary
Library    Collections


*** Variables ***
${base_url}    http://api-profile-dev.hungthinhcorp.com.vn:8080

*** Test Cases ***
Scenario: TC500 - [API][Self-register][Email]-Successfully register new account
    [Documentation]     URL: http://restapi.demoqa.com/customer
    ...         Content Type : application/json
    ...         Body:   {
    ...           "login_name": "alibaba@yopmail.com"
    ...           "password" : "Ld8@U5ONtest1"
    ...         }
    ...         Validations:
    ...             1) Status Code: 201
    ...             2) Response Body : {
    ...           "ht_id": "1414068802153925",
    ...           "active": false,
    ...           "lead_source": "Hung Thinh Mobile App",
    ...           "create_date": "20210418170431",
    ...           "type": "EMAIL"
    ...         }
    [Tags]    api   smoke
    create session    mysession     ${base_url}
    ${body} =       create dictionary    login_name = alibaba@yopmail.com   password = Ld8@U5ONtest1
    ${header} =     create dictionary   Content-Type = application/json
    ${response} =   post request    mysession    /api/profiles/accounts   data = ${body}    headers = ${header}
    log to console    ${response.status_code}
    log to console    ${response.content}

    #VALIDATION
    ${status_code} =  convert to string   ${response.status_code}
    should be equal    ${status_code}   201

    ${res_body} =    convert to string    ${response.content}
    should contain    ${res_body}   OPERATION_SUCCESS
    should contain    ${res_body}   Operation completed successfully


