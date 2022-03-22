*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections
Library     RequestsLibrary

*** Variables ***
${base_url}     https://restcountries.com/


*** Test Cases ***
#Load1 file in system
    ${json_path}=   Load JSON From File    G:/Robot/APIAuto/Data.json
    ${Name}=     Get Value From Json    ${json_path}     $.Name
    Log To Console    ${Name}
    Should Be Equal    ${Name[0]}    John

    ${Street}=     Get Value From Json    ${json_path}     $.Address.Street
    Log To Console    ${Street}
    Should Be Equal    ${Street[0]}    XYZ

    ${Mobile}=     Get Value From Json    ${json_path}     $.Address.Number[1].Mob
    Log To Console    ${Mobile}
    #Should Be Equal    ${Mobile[0]}    Mob2



Single data validation in array
    create session  session    ${base_url}
    ${response}=   GET On Session  session    /v3.1/name/peru
    #Log To Console    ${response.status_code}
    #Log To Console    ${response.content}
    #Log To Console    ${response.headers}

    ${json_object}=     To Json    ${response.content}
    Log To Console    ${json_object}
    #${json_object}=     ${response.contentjson()}
    #single data validation
    #${name}=     Get Value From Json    ${json_object}  $.name
    ${name}=     Get Value From Json    ${json_object}  $[*].name.common

    Log To Console    ${name[0]}
    Should Be Equal    ${name[0]}    Peru

    #array with multiple values
    #single data validation in array.
    #${alt_spellings_1}=     Get Value From Json    ${json_object}  $.altSpellings[0]
    ${boarder}=     Get Value From Json    ${json_object}  $[*].borders[0]
    Log To Console    ${boarder[0]}
    Should Be Equal    ${boarder[0]}    BOL

    #multiple data validation in array.
    ${alt_spellings_all}=     Get Value From Json    ${json_object}  $[*].borders
    Log To Console    ${alt_spellings_all[0]}
    Should Contain Any    ${alt_spellings_all[0]}  BRA  ECU   BOL


    #https://jsonpathfinder.com/ https://jsonpath.com/



