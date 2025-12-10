*** Settings ***
Library           Collections
Library           RequestsLibrary
Library           JSONLibrary

Suite Setup       Setup Suite
Suite Teardown    Teardown Suite


*** Variables ***
${BASE_URL}       https://google.com


*** Keywords ***
Setup Suite
    Log To Console     \n[SETUP] Criando sessão global...\n
    Create Session     consultaGoogle     ${BASE_URL}

Teardown Suite
    Log To Console     \n[TEARDOWN] Finalizando...\n


*** Test Cases ***
Get Google Homepage
    ${res}=    GET On Session    consultaGoogle    /
    Status Should Be    200    ${res}