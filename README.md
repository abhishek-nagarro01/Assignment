# NYTimesArticles

## We have used MVVM Design pattern and swift genric approach to develop this application.

It is a simple app that fetch the NY Times Most Popular Articles.
* It display the list of articles that we received from API.
* On tapping the article it display the details. 

We are using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, 
For testAPI we used 
* all-sections for the section path component in the URL
* 7 for period

## Installing

* Installation by cloning the repository
* Go to working directory
* use command + B or Product -> Build to build the project
* Press run icon in Xcode or command + R to run the project on Simulator


## Running the tests

Follow the steps to get test case reports:
* Enable coverge Data: Go to Edit Schema -> Select Test from side menu -> Checkmark for Code covrage
* use command + U or Product + Test to execute the test case
* Select last icon from Xcode Menu
* Tap on Code coverage

## Fastlane integration

Fastlane lanes are created for static code analysis, running unit test case and build the project in simulator

* Steps for static code analysis: 
* Go to working directory
* execute command:- bundle exec fastlane swiftLinting

* Steps for tests case execution: 
* Go to working directory
* execute command:- bundle exec fastlane tests

* Steps for build the project: 
* Go to working directory
* execute command:- bundle exec fastlane build

