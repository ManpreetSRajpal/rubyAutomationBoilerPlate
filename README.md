### About
This UI-based end-to-end test framework is based on:

- Ruby
- Selenium WebDriver
- Cucumber for BDD (behaviour-driven development)/Gherkin styled test syntax
- RSpec library for assertions

### Getting started
      1. I have committed the chrome driver ver. 4.0.3729.6/chromedriver_mac64.zip 
         and gecko driver ver geckodriver-v0.24.0-macos with this code.
         If you are using browsers which are not compatible with these drivers version, 
         download the compatible driver version and keep it under drivers/ dir. 
      2. Run 'bundle install'
      3. Run 'bundle exec cucumber @smoke'
      4. or You can also run rake smoke to run smoke tests

### Scenarios
      The framework has Before/After hooks defined in such a way that each scenario runs in a different browser session.
      As such, each set of tests dealing with a different user must be defined as a different Cucumber "scenario" in the .feature file(s).