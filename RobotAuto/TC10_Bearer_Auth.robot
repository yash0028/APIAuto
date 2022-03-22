*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem

#OperatingSystem used to read data from text file
#Token : some alphanumeric value


*** Variables ***
${Base_url}=    http://restapi.demoqa.com/authenticatio/students
${Bearer_token}=    "Bearer GHKN0998ESLVKA8939NVKKVK8JHF7JS30NNV9NVNN8NAWLBBMC89"

*** Test Cases ***
BearerAuth
    Create Session  Bearer     ${Base_url}
    ${headers}  Create Dictionary   Authorization=${Bearer_token}   Content-Type=text/xml
    ${req_body}=     Get File    G:/Robot/APIAuto/BearerAuthData.xml
    ${response}=     POST On Session     Bearer      /   data=${req_body}    headers=${headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}



