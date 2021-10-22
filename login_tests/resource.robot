*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        Firefox
${DELAY}          0.5
${VALID USER}     user
${VALID PASSWORD}    helloworld
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/login
${ERROR URL}      http://${SERVER}/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Element Should Contain    id:__next    Supermetrics

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    xpath:/html/body/div[1]/div/div/form/div[1]/input    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    xpath:/html/body/div[1]/div/div/form/div[2]/input    ${password}

Submit Credentials
    Click Button    xpath:/html/body/div[1]/div/div/form/button

Welcome Page Should Be Open
    Element Should Contain    id:__next    Supermetrics
