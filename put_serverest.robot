*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Test Cases ***

Realizando um Put

    Create Session    alias=server_rest    url=https://serverest.dev    verify=true

    ${header}    Create Dictionary    Content-Type=application/json

    ${Response}    PUT On Session    alias=server_rest    url=/usuarios/c8d2nsnXV2TLDFPB    expected_status=200    headers=${header}    data={ "nome": "Fulano da Silva Sauro2", "email": "fulanosauro@qa4.com.br", "password": "teste", "administrador": "true" }

    ${msg}    Set Variable    ${Response.json()['message']}
    Log To Console    ${msg}

    Should Be Equal    ${msg}    Registro alterado com sucesso

*** Keywords ***