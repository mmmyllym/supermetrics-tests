*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        Chrome
${DELAY}          1
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
    Wait Until Element Is Visible    xpath:/html/body/div[1]/div/div/div[1]/div[2]/span/div    10

Press reset
    Click Button    xpath:/html/body/div[1]/div/nav/div/button[1]

Log Out
    Click Button    xpath:/html/body/div[1]/div/nav/div/button[2]

Login as normal user
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

List of cats includes name
    Element Should Contain    xpath:/html/body/div[1]/div/div/div[1]/div[2]/span/div    James

List of cats includes picture
    Page Should Contain Image    xpath:/html/body/div[1]/div/div/div[1]/div[2]/div/img

List of cats includes awesomeness rating
    Element Should Contain    xpath:/html/body/div[1]/div/div/div[1]/div[1]/span[3]    Awesomeness

List of cats includes rank
    Element Should Contain    xpath:/html/body/div[1]/div/div/div[2]/div[1]/span[1]    Rank

Reset and close
    Log Out
    Press reset
    Close Browser
