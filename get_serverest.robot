*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Test Cases ***

Fazendo um Get

    Create Session    alias=server_rest    url=https://serverest.dev    #verify=true

    ${header}    Create Dictionary    Content-Type=application/json

    ${Response}    GET On Session    alias=server_rest    url=/usuarios?email=fulanosauro@qa4.com.br    expected_status=200    headers=${header}    
    #data={ "nome": "Fulano da Silva Sauro", "email": "fulanosauro@qa4.com.br", "password": "teste", "administrador": "true" }

*** Keywords ***