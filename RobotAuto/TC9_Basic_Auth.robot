*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Test Cases ***
BasicAuth
    ${Basic_auth}=    Create List     ToolsQA     TestPassword
    Create Session    basicauth    http://restapi.demoqa.com    auth=${Basic_auth}
    ${get_response}=    GET On Session    basicauth     /authentication
    Log To Console    ${get_response.content}
    Should Be Equal As Strings    ${get_response.status_code} 200