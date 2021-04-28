*** Settings ***
Documentation    API testing

Library    RequestsLibrary
Library    Collections


*** Variables ***
${base_url}    https://gateway-am-dev.hungthinhcorp.com.vn/testapi/v1

*** Test Cases ***
TC500 - [API][Self-register][Email] - Register new account successfull
    [Documentation]     [POST] - https://gateway-am-dev.hungthinhcorp.com.vn/testapi/v1/api/profiles/accounts
    ...         Content Type : application/json
    ...         Body:   {
    ...           "login_name": "<new_user>"
    ...           "password" : "<new_pass>"
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
    [Tags]    api   smoke_api
    create session    mysession     ${base_url}
    ${body} =       create dictionary    login_name=hongtest1@yopmail.com   password=Automation@test1
    ${header} =     create dictionary   Content-Type = application/json
    ${response} =   post request    mysession    /api/profiles/accounts   data = ${body}    headers = ${header}
    log to console    ${response.status_code}
    log to console    ${response.content}

    #VALIDATION
    ${status_code} =  convert to string   ${response.status_code}
    should be equal    ${status_code}   201

    ${res_body} =    convert to string    ${response.content}
    should be equal as strings    ${res_body}

#TC-498 [API][Self-register][Email]-Failed register with invalid email
#    [Documentation]    Execute the POST api with the invalid credentials should return status_code in range 4xx
