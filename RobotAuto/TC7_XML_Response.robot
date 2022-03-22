*** Settings ***
Library  RequestsLibrary
Library  os
Library  Collections
Library  XML

*** Test Cases ***
Respose
    Create Session    res    http://www.thomas-bayer.com
    ${respose}=   GET On Session     res    /sqlrest/CUSTOMER/27
    ${xml_string}=  Convert To String    ${respose.content}
    ${xml_obj}=     Parse Xml    ${xml_string}
    #Log To Console    ${xml_obj}

    #Check single validation
    ${id}=   Get Element Text    ${xml_obj}  .//ID
    Log To Console    ${id}
    Element Text Should Be    ${xml_obj}    27     .//ID

    #Check multiple values
    ${child}=   Get Child Elements    ${xml_obj}
    Should Not Be Empty    ${child}
    ${first}=   Get Element Text    ${child[0]}
    ${second}=   Get Element Text    ${child[1]}
    ${third}=   Get Element Text    ${child[2]}
    Log To Console    ${first}
    Log To Console    ${second}
    Log To Console    ${third}
    
    Should Be Equal    ${second}  Bob

    ${count}=   Get Element Count   ${xml_obj}
    Log To Console    ${count}
