*** Settings ***

Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://reqres.in/

*** Test Cases ***
GetReqTC
    create session  mysession    ${base_url}
    ${response}=   GET On Session  mysession    api/users/2
    #Log To Console    ${response.status_code}
    #Log To Console    ${response.content}
    #Log To Console    ${response.headers}

    #validatons
    ${Status}=  convert to string  ${response.status_code}
    Should Be Equal    ${Status}    200
    ${body}=  Convert To String   ${response.content}
    Should Contain  ${body}     Weaver
    ${header}=    get from dictionary  ${response.headers}    Content-Type
    Should Be Equal    ${header}    application/json; charset=utf-8