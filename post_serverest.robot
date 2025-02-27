*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Test Cases ***

Fazendo um Post

    Create Session    alias=server_rest    url=https://serverest.dev    #verify=true

    ${header}    Create Dictionary    Content-Type=application/json

    ${Response}    POST On Session    alias=server_rest    url=/usuarios    expected_status=201    headers=${header}    data={ "nome": "Fulano da Silva Sauro", "email": "fulanosauro@qa4.com.br", "password": "teste", "administrador": "true" }

    ${msg}    Set Variable    ${Response.json()['message']}
    Log To Console    ${msg.json()}

    Should Be Equal    ${msg}    Cadastro realizado com sucesso

*** Keywords ***