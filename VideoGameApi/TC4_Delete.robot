*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://localhost:8080


*** Test Cases ***
TC4Delete
    Create Session    delsession    ${base_url}
    ${response}=   Delete Request   delsession    /app/videogames/40
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

 #validations
    ${status_code}=  convert to string  ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${Res_body}=    Convert To String    ${response.content}
    Should Contain    ${Res_body}    Record Deleted Successfully
