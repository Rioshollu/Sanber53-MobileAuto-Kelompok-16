*** Settings ***
Library                        AppiumLibrary

*** Variables ***
${REMOTE_URL}                    http://localhost:4723/wd/hub
${PLAT_NAME}                     Android
${VERSION}                       9.0
${DEVICE_NAME}                   Pixel 2 API 28
${USERNAME}                      //android.widget.EditText[@resource-id="com.example.myapplication:id/username"]
${FROM_CITY}                     //android.widget.Spinner[@resource-id="com.example.myapplication:id/spinnerFrom"]
${TO_CITY}                       //android.widget.Spinner[@resource-id="com.example.myapplication:id/spinnerTo"]
${CLASS_FLIGHT}                  //android.widget.Spinner[@resource-id="com.example.myapplication:id/spinnerClass"]

*** Keywords ***
Login Flight Application
    Open Application        remote_url=${REMOTE_URL}     
    ...                     platformName=${PLAT_NAME}
    ...                     platformVersion=${VERSION}
    ...                     deviceName=${DEVICE_NAME}
    ...                     appPackage=com.example.myapplication	
    ...                     appActivity=com.example.myapplication.MainActivity
    
    Click Element                        locator=//android.widget.Button[@resource-id="com.example.myapplication:id/login"]
    # Input Username
    Wait Until Element Is Visible        locator=${USERNAME}
    Input Text                           locator=${USERNAME}    text=support@ngendigital.com
    # Input Passord
    Input Text                           locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/password"]   
    ...                                  text=abc123
    # btn Loggin Sign in
    Click Element                        locator=//android.widget.Button[@resource-id="com.example.myapplication:id/signIn"]

Click Book Button on Home Page
    Wait Until Element Is Visible           locator=//android.widget.Button[@resource-id="com.example.myapplication:id/book"]
    Click Element                           locator=//android.widget.Button[@resource-id="com.example.myapplication:id/book"]

Click OneWay Button on Book Page
    Wait Until Element Is Visible           locator=//android.widget.TextView[@text="ONE WAY"]
    Click Element                           locator=//android.widget.TextView[@text="ONE WAY"]

Click RoundTrip Button on Book Page
    Wait Until Element Is Visible           locator=//android.widget.TextView[@text="ROUND TRIP"]
    Click Element                           locator=//android.widget.TextView[@text="ROUND TRIP"]

Choose From City
    Wait Until Element Is Visible           locator=${FROM_CITY}    
    Click Element                           locator=${FROM_CITY}
    # Menampilkan Modal List From City
    Wait Until Element Is Visible           locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="Chicago"]
    Click Element                           locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="Chicago"]

Choose To City
    Click Element                           locator=${TO_CITY}
    # Menampilkan Modal List To City
    Wait Until Element Is Visible           locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="Ottawa"]
    Click Element                           locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="Ottawa"]

Choose Class
    Click Element                           locator=${CLASS_FLIGHT}
    # Menampilkan Modal List Class Flight
    Wait Until Element Is Visible           locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="First"]
    Click Element                           locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="First"]

Input Start Date
    Click Element                           locator=//android.widget.TextView[@resource-id="com.example.myapplication:id/textStartDate"]
    # Menunggu modal tgl tampil
    Wait Until Element Is Visible           locator=//android.view.View[@resource-id="android:id/month_view"]
    # Menampilkan modal & Memilih tgl awal
    Click Element                           locator=//android.view.View[@content-desc="08 August 2019"]
    # btn simpan tgl awal
    Click Element                           locator=//android.widget.Button[@resource-id="android:id/button1"]

Input End Date
    Click Element                            locator=//android.widget.TextView[@resource-id="com.example.myapplication:id/textEndDate"]
     # Menunggu modal tgl tampil
    Wait Until Element Is Visible           locator=//android.view.View[@resource-id="android:id/month_view"]
    # Menampilkan modal & memilih tgl akhir
    Click Element                            locator=//android.view.View[@content-desc="11 August 2019"]
    # btn simpan tgl awal
    Click Element                            locator=//android.widget.Button[@resource-id="android:id/button1"]

Choose Checkbox Flight
    Click Element                            locator=//android.widget.RadioButton[@resource-id="com.example.myapplication:id/radioButtonFlightHotel"]

Click Book Button
    Wait Until Element Is Visible            locator=//android.widget.Button[@resource-id="com.example.myapplication:id/book_flight"]
    Click Element                            locator=//android.widget.Button[@resource-id="com.example.myapplication:id/book_flight"]

Choose Price to Confirm Book
    Wait Until Element Is Visible            locator=//android.widget.Button[@resource-id="com.example.myapplication:id/price4"]   
    Click Element                            locator=//android.widget.Button[@resource-id="com.example.myapplication:id/price4"]

Click Confirm Button on Page Confirm Price
    Wait Until Element Is Visible            locator=//android.widget.Button[@resource-id="com.example.myapplication:id/confirm_order"]
    Click Element                            locator=//android.widget.Button[@resource-id="com.example.myapplication:id/confirm_order"]

Verification Flight is Booked
    Wait Until Page Contains    text=Your flight is booked. Reservation number

Close Flight Application
    Close Application

*** Test Cases ***
Book Flight with Valid Data One way
    Login Flight Application
    Click Book Button on Home Page
    Click OneWay Button on Book Page
    Choose From City
    Choose To City
    Choose Class
    Input Start Date
    Input End Date
    Choose Checkbox Flight
    Click Book Button
    Choose Price to Confirm Book
    Click Confirm Button on Page Confirm Price
    Verification Flight is Booked
    Close Flight Application

Book Flight with Valid Data Round Trip
    Login Flight Application
    Click Book Button on Home Page
    Click RoundTrip Button on Book Page
    Choose From City
    Choose To City
    Choose Class
    Input Start Date
    Input End Date
    Choose Checkbox Flight
    Click Book Button
    Choose Price to Confirm Book
    Click Confirm Button on Page Confirm Price
    Verification Flight is Booked
    Close Flight Application

Book flight does not select start & end date
    Login Flight Application
    Click Book Button on Home Page
    Click RoundTrip Button on Book Page
    Choose From City
    Choose To City
    Choose Class
    Choose Checkbox Flight
    Click Book Button
    Choose Price to Confirm Book
    Click Confirm Button on Page Confirm Price
    Verification Flight is Booked
    Close Flight Application

Book Flight Does Not Select One Start & End Date
    Login Flight Application
    Click Book Button on Home Page
    Click RoundTrip Button on Book Page
    Choose From City
    Choose To City
    Choose Class
    Input Start Date
    Choose Checkbox Flight
    Click Book Button
    Choose Price to Confirm Book
    Click Confirm Button on Page Confirm Price
    Verification Flight is Booked
    Close Flight Application 

Book Flight Does Not Fill in The Checkbox Flight, Hotel, and Day
    Login Flight Application
    Click Book Button on Home Page
    Choose From City
    Choose To City
    Choose Class
    Input Start Date
    Input End Date
    Click Book Button
    Choose Price to Confirm Book
    Click Confirm Button on Page Confirm Price
    Verification Flight is Booked
    Close Flight Application

Book Flights Don't Choose Price Booking
    Login Flight Application
    Click Book Button on Home Page
    Choose From City
    Choose To City
    Choose Class
    Input Start Date
    Input End Date
    Choose Checkbox Flight
    Click Book Button
    Click Confirm Button on Page Confirm Price
    Verification Flight is Booked
    Close Flight Application

Book Flight Does Not Select Start & End Date, Checkbox, Price Confirm
    Login Flight Application
    Click Book Button on Home Page
    Click Book Button
    Click Confirm Button on Page Confirm Price
    Verification Flight is Booked
    Close Flight Application
    