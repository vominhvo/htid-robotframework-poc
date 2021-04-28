*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem


*** Variables ***
${JSON_SERVICE_URL}
${OAUTH_API_URL}
${HEADERS}


*** Keywords ***
Initialize Session
  [Documentation]  Creates context for REST API calls.
  [Arguments]  ${apiUrl}=${JSON_SERVICE_URL}
  ${newHeaders} =  Create Dictionary  Content-Type=application/json  Authorization=Basic ${REST_API_AUTH}
  Set test Variable  ${HEADERS}  ${newHeaders}
  Create Session  session  ${apiUrl}  headers=${HEADERS}
  log  ${HEADERS}


Initialize API Session
  [Documentation]  Creates context for REST API calls.
  [Arguments]  ${apiUrl}=${OAUTH_API_URL}
  ${newHeaders} =  Create Dictionary  Content-Type=application/json  Authorization=Basic ${REST_API_AUTH}
  Set test Variable  ${HEADERS}  ${newHeaders}
  Create Session  session  ${apiUrl}  headers=${HEADERS}
  log  ${HEADERS}


Get JSON data
  [Arguments]  ${uri}  ${header}=${HEADERS}  ${status_code}=200
  [Documentation]  Reads the data as JSON object through REST API. The service URI is given as an argument.
  ...  Returns the response as a JSON object.
  ${resp}=  Get Request  session  ${uri}  headers=${HEADERS}
  log  ${resp.content}
  Should Be Equal As Strings  ${resp.status_code}  ${status_code}
  ${actual}=  Run Keyword If  '${status_code}'=='200'  To Json  ${resp.content}
  ...                   ELSE  Set Variable  ${resp.content}
  Log  ${resp.content}
  [Return]  ${actual}


Post JSON data
  [Arguments]  ${uri}  ${JSONdata}  ${statusCode}=201  ${returnType}=content  ${header}=${HEADERS}  ${checkStatus}=true
  [Documentation]  POST the JSON data to given uri. Returns the POSTed JSON data as JSON object.
  log  ${uri}
  log  ${JSONdata}
  ${resp}=  Post Request  session  ${uri}  data=${JSONdata}  headers=${header}
  Log  ${resp.text}
  Log  ${resp.headers}
  Run Keyword If  "${checkStatus}" == "true"
  ...  Should Be Equal As Strings  ${resp.status_code}  ${statusCode}
  ${actual}=  Run Keyword If  "${returnType}" == "content"
  ...           To Json  ${resp.content}
  ...         ELSE
  ...           Set Variable  ${resp}
  Log  ${actual}
  [Return]  ${actual}


Post request with JSON data
  [Arguments]  ${uri}  ${JSONdata}  ${statusCode}=200  ${returnType}=content  ${header}=${HEADERS}  ${checkStatus}=true
  [Documentation]  POST the JSON data to given uri. Returns the POSTed JSON data as JSON object.
  log  ${uri}
  log  ${JSONdata}
  ${resp}=  Post Request  session  ${uri}  data=${JSONdata}  headers=${header}
  Log  ${resp.text}
  Log  ${resp.headers}
  Run Keyword If  "${checkStatus}" == "true"
  ...  Should Be Equal As Strings  ${resp.status_code}  ${statusCode}
  ${actual}=  Run Keyword If  "${returnType}" == "content"
  ...           To Json  ${resp.content}
  ...         ELSE
  ...           Set Variable  ${resp}
  Log  ${actual}
  [Return]  ${actual}

Patch JSON data
  [Arguments]  ${uri}  ${JSONdata}  ${header}=${HEADERS}  ${expectedStatusCode}=200
  [Documentation]  Patch the JSON data to given uri. Returns the Patched JSON data as JSON object.
  log  ${uri}
  log  ${JSONdata}
  ${resp}=  Patch Request  session  ${uri}  data=${JSONdata}  headers=${headers}
  Log  ${resp.text}
  Should Be Equal As Strings  ${resp.status_code}  ${expectedStatusCode}
  ${actual}=  To Json  ${resp.content}
  Log  ${actual}
  [Return]  ${actual}


Put JSON data
  [Arguments]  ${uri}  ${JSONdata}  ${header}=${HEADERS}  ${expectedStatusCode}=200
  [Documentation]  Put the JSON data to given uri. Returns the Patched JSON data as JSON object.
  log  ${uri}
  log  ${JSONdata}
  ${resp}=  Put Request  session  ${uri}  data=${JSONdata}  headers=${headers}
  Log  ${resp.text}
  Should Be Equal As Strings  ${resp.status_code}  ${expectedStatusCode}
  ${actual}=  To Json  ${resp.content}
  Log  ${actual}
  [Return]  ${actual}


Put JSON data and Return None
  [Arguments]  ${uri}  ${JSONdata}  ${header}=${HEADERS}  ${expectedStatusCode}=200
  [Documentation]  Put the JSON data to given uri. Returns the Patched JSON data as JSON object.
  log  ${uri}
  log  ${JSONdata}
  ${resp}=  Put Request  session  ${uri}  data=${JSONdata}  headers=${headers}
  Log  ${resp.text}
  Should Be Equal As Strings  ${resp.status_code}  ${expectedStatusCode}
  Log  ${resp.content}
  [Return]  ${resp.content}


Post request with JSON data and return status code
  [Arguments]  ${uri}  ${JSONdata}  ${statusCode}=200  ${returnType}=content  ${header}=${HEADERS}  ${checkStatus}=true
  [Documentation]  POST the JSON data to given uri. Returns the POSTed JSON data as JSON object.
  log  ${uri}
  log  ${JSONdata}
  ${resp}=  Post Request  session  ${uri}  data=${JSONdata}  headers=${header}
  Log  ${resp.text}
  Log  ${resp.headers}
  Run Keyword If  "${checkStatus}" == "true"
  ...  Should Be Equal As Strings  ${resp.status_code}  ${statusCode}
  [Return]    ${resp.status_code}

Delete JSON data
  [Arguments]  ${uri}  ${header}=${HEADERS}  ${expectedStatusCode}=204
  [Documentation]  Sends a delete request to given uri.
  log  ${uri}
  ${resp}=  Delete Request  session  ${uri}  headers=${headers}  #data=${JSONdata}
  Should Be Equal As Strings  ${resp.status_code}  ${expectedStatusCode}

Delete Asset using JSON data
  [Arguments]  ${uri}  ${header}=${HEADERS}  ${expectedStatusCode}=200
  [Documentation]  Sends a delete request to given uri.
  log  ${uri}
  ${resp}=  Delete Request  session  ${uri}  headers=${headers}  #data=${JSONdata}
  Should Be Equal As Strings  ${resp.status_code}  ${expectedStatusCode}

Get JSON Form
  [Arguments]  ${formName}  ${location}=${CURDIR}${/}Resources${/}
  [Documentation]  Reads the json template. Template name is given as an argument.
  ...  Optional argument is the custom location of the file.
  Log    ${formName}
  Log    ${CURDIR}
  Log    ${CURDIR}${/}json${/}
  Log    ${location}
  ${json}=  Get File  ${location}${formName}  encoding=UTF-8
  Set Test Variable  ${JSON_FORM}  ${json}

Post request JSON data
  [Arguments]  ${uri}  ${JSONdata}  ${statusCode}=201  ${returnType}=content  ${header}=${HEADERS}  ${checkStatus}=true
  [Documentation]  POST the JSON data to given uri. Returns the POSTed JSON data as JSON object.
  ${resp}=  Post Request  session  ${uri}  data=${JSONdata}  headers=${header}
  Log    ${resp.text}
  Set test variable  ${resp.text}
  Run Keyword If  "${checkStatus}" == "true"
  ...  Should Be Equal As Strings  ${resp.status_code}  ${statusCode}

