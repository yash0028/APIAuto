*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://localhost:8080


*** Test Cases ***
 TC2PostReq
    Create Session    post    ${base_url}
    ${body}=    Create Dictionary   id:74  name:GhostRacer4  releaseDate:2022-01-06T09:25:43.084Z  reviewScore:normal  category:super1  rating:adventure
    ${header}=  Create Dictionary   Content_type=application/json
    ${response}=    POST On Session    post    /app/videogames   data=${body}    headers=${header}
    Log To Console    ${response1.status_code}
    Log To Console    ${response1.content}

  #Validations
    ${Resp_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${Resp_code}      201

    ${Resp_body}=    Convert To String    ${response.content}
    Should Contain    ${Resp_body}    Record Added Successfully
