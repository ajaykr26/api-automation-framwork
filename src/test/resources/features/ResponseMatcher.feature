Feature: To validate GET end point
  To validate the get end point response

  Background: Setup the base url
    Given url 'http://jobportalkarate.herokuapp.com'
    And def jsondata = read('classpath:/features/Testdata.json')
    And def xmldata = read('classpath:/features/Testdata.xml')
    And headers read('classpath:/headers/headerXml.json')


  @ignore
  Scenario: To get all the data from application in JSON format
    Given path '/normal/webapi/all'
    When method GET
    Then status 200
    And match response == jsondata

  @ignore
  Scenario: To get all the data from application in xml format
    Given path '/normal/webapi/all'
    And header accept = 'application/xml'
    When method GET
    Then status 200
    And print response
    And match response == read('classpath:/features/Testdata.xml')

  @ignore
  Scenario: To get the data in JSON format and validate a specific data
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method GET
    Then status 200
    And print response
    Then match response contains deep {"project":[{"projectName": "Movie App"}]}
    Then match response contains deep {"jobDescription": "To develop andriod application"}
    And match header content-type == 'application/json'
    And match header connection == 'keep-alive'

  @ignore
  Scenario: To get all the data from application in xml format
    Given path '/normal/webapi/all'
    And header accept = 'application/xml'
    When method GET
    Then status 200
    And print response
    Then match //jobDescription == 'To develop andriod application'
    Then match //experience/experience == ['Google', 'Apple', 'Mobile Iron']
    And match header content-type == 'application/xml'
    And match header connection == 'keep-alive'

  @ignore
  Scenario: To get the data in JSON format and validate a specific data
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method GET
    Then status 200
    And print response
    Then match response[0].jobTitle == 'Software Engg'
    Then match response[0].experience[1] == 'Apple'
    Then match response[0].project[0].technology[0] == 'Kotlin'
    #validate the size of array
    Then match response[0].experience == '#[3]'
    Then match response[0].project[0].technology == '#[3]'
    Then match response == '#[1]'
    #wildcard char
    Then match response[0].experience[*] == ['Google','Apple','Mobile Iron']
    Then match response[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
    Then match response[0].project[0].technology[*] contains ["SQL Lite","Gradle"]


  @RunTest
  Scenario: To get all the data from application in xml format
    Given path '/normal/webapi/all'
    And header accept = 'application/xml'
    When method GET
    Then status 200
    And print 'response: ', response
    And def testdata = read('classpath:/payloads/Testdata.xml')
    And match response == testdata
    And def data = karate.xmlPath(testdata, '//jobTitle')
    And print 'testdata: ', data

    Then match //experience/experience[1] == data
    And match header content-type == 'application/xml'
    And match header connection == 'keep-alive'




