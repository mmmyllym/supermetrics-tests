*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login User
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Reset and Close

Valid Login Admin
    Open Browser To Login Page
    Input Username    ${VALID ADMIN}
    Input Password    ${VALID ADMIN PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Reset and Close
