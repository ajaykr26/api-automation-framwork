Feature: to create js function

  @ignore
  Scenario: js implementation in feature file
    * def getIntVal = function () {  return 10;  }
    Then print "==========>", getIntVal()
    * def getRandVal = function() { return Math.floor((100) * Math.random()); }
    Then print "==========>", getRandVal()
    * def getArg = function (arg) {  return "hello: " + arg;  }
    Then print "==========>", getArg("ajay")

  Scenario: js implementation in js file
    * def int_val =  call read('classpath:/utils/get_random_num.js')
    Then print "==========>", int_val

  @ignore
  Scenario: js implementation in js file
    * def functions =  call read('classpath:/utils/authentication.js')
    Then print "==========>", functions.get_int()


