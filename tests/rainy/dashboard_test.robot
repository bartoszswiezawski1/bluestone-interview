*** Settings ***
Library             SeleniumLibrary
Resource            ../../resources/common.resource
Resource            ../../resources/config.resource
Resource            ../../resources/selectors.resource
Resource            ../../resources/page_login.robot
Resource            ../../resources/page_dashboard.robot

Suite Setup         Log in successfully
Suite Teardown      Browser close


*** Test Cases ***
Get 0 results for invalid search
    [Tags]    robot:skip    # bug - https://github.com/bartoszswiezawski1/bluestone-interview/issues/1
    Input dashboard search    John
    Element Attribute Value Should Be    ${GRID}    ${ROW_COUNT}    1
