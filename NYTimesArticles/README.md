# This project is using MVVM design pattern.

#Step to run the project
## Go to working Directory
## Open NYTimesArticles.xcworkspace
## use command + B or Product -> Build to build the project
## Press run icon in Xcode or command + R to run the project on Simulator

#Step to execute test cases
## use command + U or Product + Test to execute the test case

#Fastlane lanes are created for static code analysis, running unit test case and build the project in simulator

#Steps for static code analysis

##Go to working directory
## execute command:- bundle exec fastlane swiftLinting

#Steps for test case execution

##Go to working directory
## execute command:-  bundle exec fastlane tests

#Steps for build the project

##Go to working directory
## execute command:- bundle exec fastlane build
