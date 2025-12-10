*** Settings ***
Resource    api.resource

Suite Setup    Authenticate as Admin


*** Test Cases ***

Get Bookings Successfully
    Create Restful Session
    ${resp}=    Get Bookings By Firstname    John
    Status Should Be    200    ${resp}
    Log List    ${resp.json()}


Create And Validate Booking
    Create Restful Session

    ${resp}=    Create Booking    Hans    Gruber    200    false    2022-12-31    2023-01-01
    Status Should Be    200    ${resp}

    ${id}=    Set Variable    ${resp.json()}[bookingid]
    Set Suite Variable    ${id}

    ${get}=    GET On Session    restful    /booking/${id}
    Should Be Equal    ${get.json()}[firstname]    Hans
    Should Be Equal    ${get.json()}[lastname]    Gruber
    Should Be Equal As Numbers    ${get.json()}[totalprice]    200


Delete Created Booking
    Create Restful Session
    ${resp}=    Delete Booking    ${id}
    Status Should Be    201    ${resp}
