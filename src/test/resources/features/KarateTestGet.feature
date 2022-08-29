Feature: Sample API Test

  Background:
    Given url 'http://jobportalkarate.herokuapp.com'
    And print '====================This is background keyword===================='

  Scenario: To get all the data from application in JSON format
#    Given url 'http://jobportalkarate.herokuapp.com/normal/webapi/all'
    Given path '/normal/webapi/all'
    When method GET
    Then status 200

  @ignore
  Scenario: To get all the data from application in JSON format using path variable
#    Given url 'http://jobportalkarate.herokuapp.com'
    Given path '/normal/webapi/all'
    When method GET
    Then status 200

  Scenario: To get all the data from application in JSON format
#    Given url 'http://jobportalkarate.herokuapp.com'
    Given path '/normal/webapi/all'
    And header accept = 'application/json'
    When method GET
    Then status 200
    And print response

  @ignore
  Scenario: To get all the data from application in xml format
#    Given url 'http://jobportalkarate.herokuapp.com'
    Given path '/normal/webapi/all'
    And header accept = 'application/xml'
    When method GET
    Then status 200
    And print response
