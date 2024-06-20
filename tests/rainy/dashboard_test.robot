*** Settings ***
Library             SeleniumLibrary
Resource            ../../resources/config.resource
Resource            ../../resources/selectors.resource
Resource            ../../resources/common.resource

Suite Setup         Browser setup
Suite Teardown      Browser close


*** Test Cases ***
Get 0 results for invalid search
    [Tags]    robot:skip    # bug
    Log in
    Wait Until Element Is Visible    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    John
    Element Attribute Value Should Be    ${GRID}    ${ROW_COUNT}    1
