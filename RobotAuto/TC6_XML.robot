*** Settings ***
Library     XML
Library     os
Library     Collections
Library    SeleniumLibrary

*** Test Cases ***
Tc1
    ${xml_object}=      Parse Xml    G:/Robot/APIAuto/Xmlfile.xml

    #validations
    #1 check sinlge element value:
    ${text}=    Get Element Text    ${xml_object}   .//note[1]/to
    Log To Console    ${text}
    Should Be Equal   ${text}   Tove

     ${body}=    Get Element Text    ${xml_object}   .//note[4]/body
    Log To Console    ${body}
    Should Be Equal   ${body}      I will not be ready

    #2 check Number of elements(main elements- note id's)
    ${count}=   Get Element Count   ${xml_object}    .//note
    Log To Console    ${count}
    Should Be Equal As Integers    ${count}    4

    #3 Check value of child elements
    ${child}=   Get Child Elements    ${xml_object}     .//note[4]
    Should Not Be Empty    ${child}
    ${to}=   Get Element Text    ${child[0]}
    ${from}=   Get Element Text    ${child[1]}
    ${heading}=   Get Element Text    ${child[2]}

    Log To Console    ${to}
    Log To Console    ${from}
    Log To Console    ${heading}

    #4 check attribute values
    XML.Element Attribute Should Be   ${xml_object}   id  504    .//note[4]
    XML.Element Attribute Should Be   ${xml_object}   he    Reminder22    .//note[2]/heading