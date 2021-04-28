*** Settings ***
Documentation   A Demo uses RequestsLibrary and RESTinstance for API (test) automation.
...    We are using JSONPlaceholder as the system under test in these examples.

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    json

#Library    REST    https://jsonplaceholder.typicode.com

Suite Setup       Create session    typicode    https://jsonplaceholder.typicode.com
Suite Teardown    Delete all sessions

*** Variable ***
${json}         { "id": 11, "name": "Gil Alexander" }
&{dict}         name=Julie Langford

*** Test Cases ***
# simple way to test JSON APIs
Requests: Should have a name and belong to a company with a slogan
  ${resp}=        GET request               typicode              /users/1
  Log to console    ${resp}
  Should Be Equal As Integers               ${resp.status_code}   200
  Log to console    ${resp.status_code}
  ${name}=        GET From Dictionary       ${resp.json()}        name
  Should Be Equal As Strings                ${name}               Leanne Graham
  Log to console   ${name}
  ${co}=          GET From Dictionary       ${resp.json()}        company
  ${co_slogan}=   GET From Dictionary       ${co}                 catchPhrase
  Should Be Equal As Strings  ${co_slogan}  Multi-layered client-server neural-net
  Log to console    ${co}
  Log to console    ${co_slogan}

  ${json}=        Dumps                     ${resp.json()}        indent=${4}
  Log to Console  ${json}

