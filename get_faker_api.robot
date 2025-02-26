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

*** Keywords ***
