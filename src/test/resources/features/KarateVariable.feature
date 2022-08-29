Feature: variable creation in karate framework

  Background: global variable
    Given def var_global = "global"

  Scenario: to create a variable
    Given def var_int1 = 10
    And def var_string1 = "ajay kumar"
    And print "int variable is-------->", var_int1
    And print "string variable is-------->", var_string1
    And print "global variable is-------->", var_global

  Scenario: to create a variable
    Given def var_int2 = 10
    And def var_string2 = "ajay kumar"
    And print "int variable is-------->", var_int2
    And print "string variable is-------->", var_string2
    And print "global variable is-------->", var_global

