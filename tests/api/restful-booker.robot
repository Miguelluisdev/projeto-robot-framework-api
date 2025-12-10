*** Settings ***
Library    RequestsLibrary
Library    Collections
Suite Setup    Authenticate as Admin

*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com


*** Test Cases ***
Get Bookings from Restful Booker
    Create Session    restful    ${BASE_URL}
    ${params}    Create Dictionary    firstname=John
    ${response}    GET On Session    restful    /booking    params=${params}
    Status Should Be    200    ${response}
    Log List    ${response.json()}

Create a Booking at Restful Booker
    Create Session    restful    ${BASE_URL}
    ${booking_dates}    Create Dictionary    checkin=2022-12-31    checkout=2023-01-01
    ${body}    Create Dictionary    firstname=Hans    lastname=Gruber    totalprice=200    depositpaid=false    bookingdates=${booking_dates}
    ${response}    POST On Session    restful    /booking    json=${body}
    Status Should Be    200    ${response}
    ${id}    Set Variable    ${response.json()}[bookingid]
    Set Suite Variable    ${id}

    ${response}    GET On Session    restful    /booking/${id}
    Log    ${response.json()}
    Should Be Equal    ${response.json()}[lastname]    Gruber
    Should Be Equal    ${response.json()}[firstname]    Hans
    Should Be Equal As Numbers    ${response.json()}[totalprice]    200

Delete Booking
    Create Session    restful    ${BASE_URL}
    ${header}    Create Dictionary    Cookie=token=${token}
    ${response}    DELETE On Session    restful    /booking/${id}    headers=${header}
    Status Should Be    201    ${response}

*** Keywords ***
Authenticate as Admin
    Create Session    restful    ${BASE_URL}
    ${body}    Create Dictionary    username=admin    password=password123
    ${response}    POST On Session    restful    /auth    json=${body}
    ${token}    Set Variable    ${response.json()}[token]
    Set Suite Variable    ${token}
