mresearch-test
==============

For automated acceptance testing we use the following tools:
1. [Thucydides](http://thucydides.info)
2. [JBehave](http://jbehave.org)
3. [Selenium Web Driver](http://docs.seleniumhq.org/projects/webdriver) (for PhantomJS).

The acceptance test server is configured and up and running on http://acceptance.survey-archive.com:8080/ server
against the dev server http://dev.survey-archive.com

Run the tests locally
-----------------------

Run the command: `mvn clean verify site -Dmaven.test.failure.ignore=true`.
