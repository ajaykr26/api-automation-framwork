Feature: To validate GET end point
  To validate the get end point response

  Background: Setup the base url
    Given url 'http://jobportalkarate.herokuapp.com'
    And def headers = read('classpath:/headers/XmlResponseMatcher.json')
#    And def params = read('classpath:/params/XmlResponseMatcher.json')
    And def paths = read('classpath:/paths/XmlResponseMatcher.json')
    And def payloads = read('classpath:/payloads/XmlResponseMatcher.xml')


  Scenario: To get all the data from application in xml format
    And headers headers[0].SC3
    And path paths[0].SC3
    And def payload = karate.xmlPath(payloads, '//SC3/List')
    When method GET
    Then status 200
    And match response == payload
    Then print 'verified'

#  @ignore
#  Scenario: To get all the data from application in xml format
#    Given path '/normal/webapi/all'
#    And header accept = 'application/xml'
#    When method GET
#    Then status 200
#    And print response
#    Then match //jobDescription == 'To develop andriod application'
#    Then match //experience/experience == ['Google', 'Apple', 'Mobile Iron']
#    And match header content-type == 'application/xml'
#    And match header connection == 'keep-alive'

#  @RunTest
#  Scenario: To get all the data from application in xml format
#    Given path '/normal/webapi/all'
#    And header accept = 'application/xml'
#    When method GET
#    Then status 200
#    And print 'response: ', response
#    And def testdata = read('classpath:/payloads/Testdata.xml')
#    And match response == testdata
#    And def data = karate.xmlPath(testdata, '//jobTitle')
#    And print 'testdata: ', data
#
#    Then match //experience/experience[1] == data
#    And match header content-type == 'application/xml'
#    And match header connection == 'keep-alive'




