*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Test Cases ***

Realizando primeiro GET no Faker API

    Create Session    alias=faker_api    url=https://fakerapi.it/api/v1/

    ${RESPONSE}    GET On Session    alias=faker_api    url=addresses?_quantity=1
    Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.text}

    ${RESPONSE}    GET On Session    alias=faker_api    url=books?_quantity=1
    Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.text}


    Delete All Sessions

    ${Return}    Session Exists    alias=faker_api
    Log To Console    ${Return}

Realizando outro GET 1

    Create Session    alias=faker_api    url=https://fakerapi.it/api/v1/

    ${RESPONSE}    GET On Session    alias=faker_api    url=books?_quantity=1    expected_status=200
    Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.text}

    Delete All Sessions

Realizando outro GET 2

    Create Session    alias=faker_api    url=https://fakerapi.it/api/v1/

    ${RESPONSE}    GET On Session    alias=faker_api    url=images?_quantity=1&_type=kittens&_height=300
    Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.text}

    Delete All Sessions

Teste com If Else

    Create Session    alias=faker_api    url=https://fakerapi.it/api/v1/

    ${RESPONSE}    GET On Session    alias=faker_api    url=addresses?_quantity=2

    #Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.json()['data'][1]['country']}

    ${var}    Set Variable    ${RESPONSE.json()['data'][1]['country']}

    IF    '${var}'=='Brazil'
        Log To Console    Estamos no Brazil!
        ELSE
        Log To Console    Estamos em ${var}
    END
    
    Should Be Equal    ${var}    Brazil

    Delete All Sessions

Teste com For
    
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v1/    verify=true

    FOR  ${i}    IN RANGE    20
        ${RESPONSE}    GET On Session    alias=faker_api    url=addresses?_quantity=2

        Log To Console    ${RESPONSE.json()['data'][0]['country']}
        ${var}    Set Variable    ${RESPONSE.json()['data'][0]['country']}

        Exit For Loop If    '${var}'=='Brazil'
        Exit For Loop If    '${var}'=='Luxembourg'
        Exit For Loop If    '${var}'=='Ethiopia'
        Exit For Loop If    '${var}'=='Singapore'
        Exit For Loop If    '${var}'=='Fiji'
        Exit For Loop If    '${var}'=='American Samoa'
        Exit For Loop If    '${var}'=='Malawi'
        Exit For Loop If    '${var}'=='Cape Verde'
        Exit For Loop If    '${var}'=='Congo'
        Exit For Loop If    '${var}'=='Palau'
        Exit For Loop If    '${var}'=='Unite States Minor Outlying Islands'
        Exit For Loop If    '${var}'=='Cameroon'
        Exit For Loop If    '${var}'=='Estonia'
        Exit For Loop If    '${var}'=='Tunisia'

        Sleep    2s

    END

    Delete All Sessions
    
    IF    '${var}'=='Brazil'
        Log To Console    Estamos no Brazil
    ELSE
        Log To Console    Não veio o resultado esperado
        Fail
    END
    
    Log To Console    Sai do loop com esse pais -> ${var}


*** Keywords ***
