*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://chiangmuan.igovapp.com/
${EMAIL}       gkeeodmei@gmail.com
${PASSWORD}    testpass
${BROWSER}     chrome

*** Test Cases ***
Open Web And Go To Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    20s

    # กดปุ่มเข้าสู่ระบบหน้าเว็บหลัก
    Wait Until Element Is Visible    xpath=//a[contains(text(),"เข้าสู่ระบบ")]
    Click Element    xpath=//a[contains(text(),"เข้าสู่ระบบ")]

    # รอ redirect ไป LINE
    Wait Until Location Contains    access.line.me

    # รอ input email
    Wait Until Element Is Visible    name=tid
    Wait Until Element Is Enabled    name=tid
    Click Element    name=tid
    Input Text       name=tid    ${EMAIL}

    # รอ input password
    Wait Until Element Is Visible    name=tpasswd
    Wait Until Element Is Enabled    name=tpasswd
    Click Element    name=tpasswd
    Input Password   name=tpasswd    ${PASSWORD}

    # รอปุ่ม submit พร้อมใช้งาน
    Wait Until Element Is Visible    css:button[type="submit"]
    Wait Until Element Is Enabled    css:button[type="submit"]

    # กดปุ่มเข้าสู่ระบบ
    Click Element    css:button[type="submit"]

    Sleep    5s
    Close Browser
