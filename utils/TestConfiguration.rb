require 'selenium-webdriver'
require 'yaml'

class TestConfiguration


  attr_reader :okta_login_url
  attr_reader :page_timeout
  attr_reader :object_timeout
  attr_reader :browser


  def initialize(environment)
    @default_browser = ENV['BROWSER']
    cwd = File.dirname(__dir__)
    config_file = File.join(cwd, '/config/config.yml')
    config = YAML.load_file(config_file)[environment]
    @okta_login_url = config['okta_login_url']
    @page_timeout = config['page_timeout']
    @object_timeout = config['object_timeout']
  end

  def self.load_configuration(environment)
    @browser = ENV['BROWSER'].nil? ? @default_browser : ENV['BROWSER']
    TestConfiguration.new(environment)
  end

  def self.browser
    @browser
  end

end
