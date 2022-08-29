Feature: create a job entry in the application
  Use method: POST and path: /normal/webapi/add to add new job entry in the application

  Background: Create and initialize the base url
    Given url 'http://jobportalkarate.herokuapp.com'

  @ignore
  Scenario: Create new job entry in JSON format
    Given path '/normal/webapi/add'
    And request {"jobId": 2,"jobTitle": "Software Tester","jobDescription": "To test application","experience": ["cognizant","Accenture","IBM"],"project": [{"projectName": "VAA","technology": ["selenium","java","cucumber"]}]}
    And headers {accept: 'application/json', content-type: 'application/json'}
    And method POST
    And print response

  @ignore
  Scenario: Create new job entry in external JSON format
    Given path '/normal/webapi/add'
    And request read('classpath:/features/KarateTestPost.json')
    And headers read('classpath:/headers/header.json')
    And method POST
    And print response

  @ignore
  Scenario: Create new job entry in external xml format
    Given path '/normal/webapi/add'
    And request read('classpath:/features/KarateTestPost.xml')
    And headers read('classpath:/headers/headerXml.json')
    And method POST
    And print response

  Scenario: To validate JSON schema
    Given path '/normal/webapi/add'
    And request read('classpath:/features/KarateTestPost.json')
    And headers read('classpath:/headers/header.json')
    And method POST
    And status 201
    And print response
    And match response == read('classpath:/features/SchemaJSON.json')
    
