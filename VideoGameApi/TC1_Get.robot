*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://localhost:8080


*** Test Cases ***
#TC1GetReq
    Create Session    getsession    ${base_url}
    ${response}=   GET On Session    getsession    /app/videogames
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

 #validations
    ${status_code}=  convert to string  ${response.status_code}
    Should Be Equal    ${status_code}    200

TCGetReqOne
    Create Session    getsession    ${base_url}
    ${response}=   GET On Session    getsession    /app/videogames/7
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

 #validations
    ${status_code}=  convert to string  ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${Res_body}=    Convert To String    ${response.content}
    Should Contain    ${Res_body}    Minecraft
    Should Contain    ${Res_body}    Universal
    ${header}=    get from dictionary  ${response.headers}    Content-Type
    Should Be Equal    ${header}    application/xml


