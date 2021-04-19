*** Settings ***
Documentation   Login keywords definition used for creating Login test cases
Resource        common_keywords.robot


*** Variables ***
${LOGIN_URL}    https://htid.hungthinhcorp.com.vn/authenticationendpoint/login.do?client_id=C7Uj0Civ7kH6S85tEzbKxttBj_oa&code_challenge=oSglpTFFVbXZH7zn7LDbHJaBIQ-jkqni5jHgJ6tzQck&code_challenge_method=S256&commonAuthCallerPath=%2Foauth2%2Fauthorize&forceAuth=false&passiveAuth=false&redirect_uri=https%3A%2F%2Fht-id-spa-demo.herokuapp.com&response_type=code&scope=openid+profile+phone&tenantDomain=carbon.super&sessionDataKey=2510ab5a-e97b-4721-8d20-9766f8e5f7fc&relyingParty=C7Uj0Civ7kH6S85tEzbKxttBj_oa&type=oidc&sp=htid-heroku-spa&isSaaSApp=false&authenticators=BasicAuthenticator%3ALOCAL
${LOGIN_BUTTON_ID}


*** Keywords ***
I open the Login page
   I open the HungThinhID homepage
   I wait until element visible and click button   ${LOGIN_BUTTON_ID}