# é um arquivo inicial usado pelo Robot Framework dentro de um Resource ou Test Suite Directory.

# ✔ Carregar variáveis automaticamente
# ✔ Importar recursos (resources) automaticamente
# ✔ Criar sessões iniciais (ex.: API, Web, Banco)
# ✔ Definir Setup e Teardown globais
# ✔ Configurar keywords reutilizáveis
# ✔ Padronizar ambiente de testes (BASE_URL, tokens, headers...)
# ✔ Evitar repetição de código nos testes individuais

***Settings***
Library  Collections
Library           RequestsLibrary
Library           JSONLibrary
Resource          ../resources/common_keywords.robot
Variables         ../variables/global_variables.py

Suite Setup       Setup Suite
Suite Teardown    Teardown Suite

*** Variables ***
${BASE_URL}       https://restful-booker.herokuapp.com
${HEADERS}        {}


*** Keywords ***
Setup Suite 
   Log To Console \n[ SUITE SETUP ] iniciando o ambiente... \nos
   Create Session  restful ${BASE_URL}

Teardown Suite
   Log To Console \n [ SUITE TEARDOWN ] Finalizando suite... \nos
   