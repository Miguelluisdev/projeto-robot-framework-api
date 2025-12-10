*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}       https://restful-booker.herokuapp.com
${ADMIN_USER}     admin
${ADMIN_PASS}     password123


*** Keywords ***
Create Restful Session
    Create Session    restful    ${BASE_URL}


Authenticate as Admin
    Create Restful Session
    ${body}=    Create Dictionary    username=${ADMIN_USER}    password=${ADMIN_PASS}
    ${resp}=    POST On Session    restful    /auth    json=${body}
    ${token}=    Set Variable    ${resp.json()}[token]
    Set Suite Variable    ${token}


Get Bookings By Firstname
    [Arguments]    ${firstname}
    ${params}=    Create Dictionary    firstname=${firstname}
    ${resp}=    GET On Session    restful    /booking    params=${params}
    [Return]    ${resp}


Create Booking
    [Arguments]    ${firstname}    ${lastname}    ${price}    ${deposit}    ${checkin}    ${checkout}
    ${dates}=    Create Dictionary    checkin=${checkin}    checkout=${checkout}
    ${body}=    Create Dictionary
    ...    firstname=${firstname}
    ...    lastname=${lastname}
    ...    totalprice=${price}
    ...    depositpaid=${deposit}
    ...    bookingdates=${dates}

    ${resp}=    POST On Session    restful    /booking    json=${body}
    [Return]    ${resp}


Delete Booking
    [Arguments]    ${booking_id}
    ${headers}=    Create Dictionary    Cookie=token=${token}
    ${resp}=    DELETE On Session    restful    /booking/${booking_id}    headers=${headers}
    [Return]    ${resp}
