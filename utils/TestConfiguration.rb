require 'selenium-webdriver'
require 'yaml'
require 'psych'
require_relative './TestConfig'


class Test

  def initialize(name)
    @name = name
  end
end

class TestConfiguration

  attr_reader :page_time_out
  attr_reader :object_time_out
  attr_reader :env_name
  attr_reader :login_url


  def initialize(environment)
    @default_browser = 'chrome'

    cwd = File.dirname(__dir__)
    config_file = File.join(cwd, '/config/config.yml')
    list_of_config = YAML.load_file(config_file)
    list_of_config
        .select {|list| list['envName'] == environment}
        .map do |config|

      @env_name = config['envName']
      @login_url = config['loginURL']
      @page_time_out = config['pageTimeOut']
      @object_time_out = config['objectTimeOut']
    end
  end

  def self.load_configuration(environment)
    @temp_browser = ENV['BROWSER']
    @browser = @temp_browser.nil? ? @default_browser : @temp_browser
    test_configuration = TestConfiguration.new(environment)
    test_configuration
  end

  def self.browser
    @browser
  end

  def self.page_time_out
    @pageTimeOut
  end

end
