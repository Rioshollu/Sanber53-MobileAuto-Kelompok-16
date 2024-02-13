*** Setting ***
Library                        AppiumLibrary

*** Variables ***

*** Keywords ***
Open Flight Application
    Open Application        remote_url=http://localhost:4723/wd/hub
    ...                     platformName=Android
    ...                     platformVersion=9.0
    ...                     deviceName=Pixel 2 API 28
    ...                     appPackage=com.example.myapplication	
    ...                     appActivity=com.example.myapplication.MainActivity

Click Sign In Button On Home Page
    Click Element                        locator=//android.widget.Button[@resource-id="com.example.myapplication:id/login"]

Input Username
    Wait Until Element Is Visible        locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/username"]
    Input Text                           locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/username"]    
    ...                                  text=support@ngendigital.com

Input Username Invalid
    Wait Until Element Is Visible        locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/username"]
    Input Text                           locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/username"]    
    ...                                  text=rioshollu

Input Password
    Input Text                           locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/password"]   
    ...                                  text=abc123

Click Sign In Button On Login Page
    Click Element                        locator=//android.widget.Button[@resource-id="com.example.myapplication:id/signIn"]

Verifikasi Wrong Sign In
    Wait Until Page Contains    text=Invalid username/password
    

Close Flight Application
    Close Application

*** Test Cases ***
Login with Valid Data
    Open Flight Application
    Click Sign In Button on Home Page
    Input Username
    Input Password
    Click Sign In Button on Login Page
    Close Flight Application

Login with Invalid Data
    Open Flight Application
    Click Sign In Button On Home Page
    Input Username Invalid
    Input Password 
    Click Sign In Button On Login Page
    Verifikasi Wrong Sign In
    Close Flight Application
    