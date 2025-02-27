*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Test Cases ***

Realizando Delete
    
    Create Session    alias=server_rest    url=https://serverest.dev    verify=true

    ${RESPONSE}    DELETE On Session    alias=server_rest    url=/usuarios/c8d2nsnXV2TLDFPB    expected_status=200

    Log To Console    ${RESPONSE.text}


*** Keywords ***