This project is an attempt and, at the same time, a feasibilty study of migrating the beautiful angularjs bootstrap-ui project from js to Dart. 


----------------------
-- INTEGRATION TESTS:
----------------------

The 'test' folder contains integration tests that must run with karma.
To execute them in ubuntu:

 ----------------
 - Prerequisites
 ----------------
  nodejs is installed properly
  
 --------------------- 
 - Install karma-dart
 ---------------------
    in the terminal:
      // connect as root
      sudo su
      // install karma-dart globally
      npm install karma-dart -g
      //disconnect root
      exit
 
  --------------------
  - Execute the tests
  --------------------
    Execute in the src/main/webapp/angular folder:
    karma start karma.conf.js
    
    start Dartium an browse to http://localhost:9876/
 
 

