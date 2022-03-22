*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://localhost:8080


*** Test Cases ***
 TC3PutReq
    Create Session    put    ${base_url}
    ${body}=    Create Dictionary   id:9  name:Final PUT VVII  releaseDate:1997-08-20  reviewScore:normal  category:super1  rating:adventure
    ${header}=  Create Dictionary   Content_type=application/json
    ${response}=    PUT On Session  put    /app/videogames/9   data=${body}    headers=${header}
    Log To Console    ${response1.status_code}
    Log To Console    ${response1.content}

  #Validations
    ${Resp_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${Resp_code}    200

    ${Resp_body}=    Convert To String    ${response.content}
    Should Contain    ${Resp_body}    Final PUT VVII
