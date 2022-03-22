*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://reqres.in/

*** Test Cases ***
PostReq
    Create Session    post    ${base_url}
    ${body}=    Create Dictionary   name: yashll  job: leader
    ${header}=  Create Dictionary   Content_type=application/json
    ${response}=    POST On Session    post    api/users   data=${body}    headers=${header}
    Log To Console   ${response.status_code}
    Log To Console   ${response.content}

    #Validations
    ${Res_code}=    Convert To String    ${response.status_code}
    Should Contain    ${Res_code}    201

    ${Res_body}=    Convert To String    ${response.content}
    Should Contain    ${Res_body}    createdAt
    Should Contain    ${Res_body}    id

