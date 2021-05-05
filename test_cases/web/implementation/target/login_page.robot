#####################################################################
# For Login page
#####################################################################

*** Variables ***
${url_prelogin_login}      https://ht-id-spa-demo.herokuapp.com/?sp=Demo+SPA+-+heroku&tenantDomain=carbon.super
${txt_prelogin_login}      HT ID Demo - Web Client
${btn_prelogin_login}      xpath=//button[contains(@class,btn-primary)]
${txt_username_login}      id=usernameUserInput
${txt_password_login}      id=password
${btn_dangnhap_login}      xpath=//button[contains(text(),'Đăng nhập')]
${btn__logout_login}       xpath=//button[contains(text(),'LOGOUT')]

