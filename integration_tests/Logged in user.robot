*** Settings ***
Documentation     A test suite with logged in user
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Can see a list of cats
    Login as normal user
    List of cats includes name
    List of cats includes picture
    List of cats includes awesomeness rating
    List of cats includes rank
    [Teardown]    Reset and Close

Calcution of awesomeness
    Login as normal user
    [Teardown]    Reset and Close

Presented in descending order
    Login as normal user
    [Teardown]    Reset and Close
