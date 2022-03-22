*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Test Cases ***
#Header
    Create Session    headers    http://jsonplaceholder.typicode.com
    ${get_response}=    GET On Session    headers    /photos
    Log To Console    ${get_response.headers}
    ${content_type}=    Get From Dictionary    ${get_response.headers}   Content-Type
    Log To Console    ${content_type}
    ${content_encoding}=    Get From Dictionary    ${get_response.headers}   Content-Encoding
    Log To Console    ${content_encoding}
    Should Be Equal    ${content_encoding}      gzip
    Should Be Equal    ${content_type}          application/json; charset=utf-8


 Cookies
    Create Session    cookies    https://seller.flipkart.com
    ${get_response}=    GET On Session    cookies   /sell-online
    Log To Console    ${get_response.cookies}
    ${cookie_value}=    Get From Dictionary    ${get_response.cookies}   T
    Log To Console    ${cookie_value}
