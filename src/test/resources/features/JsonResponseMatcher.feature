Feature: To validate GET end point
  To validate the get end point response

  Background: Setup the base url
    Given url 'http://jobportalkarate.herokuapp.com'
    And def json = read('classpath:/payloads/JsonResponseMatcher.json')

  @RunTest
  Scenario: To get all the data from application in JSON format
    Given def data = json[0].SC1[0]
    And headers data.headers
    And path data.path
    And def payload = data.payload
    When method GET
    Then status 200
    And match response == payload

#  @RunTest
#  Scenario: To get the data in JSON format and validate a specific data
#    When method GET
#    Then status 200
#    And print response
#    Then match response contains deep {"project":[{"projectName": "Movie App"}]}
#    Then match response contains deep {"jobDescription": "To develop andriod application"}
#    And match header content-type == 'application/json'
#    And match header connection == 'keep-alive'
#
#  @RunTest
#  Scenario: To get the data in JSON format and validate a specific data
#    When method GET
#    Then status 200
#    And print response
#    Then match response[0].jobTitle == 'Software Engg'
#    Then match response[0].experience[1] == 'Apple'
#    Then match response[0].project[0].technology[0] == 'Kotlin'
#    #validate the size of array
#    Then match response[0].experience == '#[3]'
#    Then match response[0].project[0].technology == '#[3]'
#    Then match response == '#[1]'
#    #wildcard char
#    Then match response[0].experience[*] == ['Google','Apple','Mobile Iron']
#    Then match response[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
#    Then match response[0].project[0].technology[*] contains ["SQL Lite","Gradle"]