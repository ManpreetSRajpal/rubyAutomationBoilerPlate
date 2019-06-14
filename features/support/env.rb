require 'selenium-webdriver'
require 'cucumber'
require 'report_builder'
require 'fileutils'
require 'pg'
require_relative '../../features/support/pages/BasePage'

$target_folder = 'test_artifacts'

rem_dir = FileUtils.remove_dir "#{$target_folder}" if File.directory?($target_folder)
run_dir = FileUtils.mkdir_p("#{$target_folder}/Automation")
rem_dir
value = run_dir.to_s
$VALUE = value[2..-3]
$APPLICATION_NAME = 'Go Secure E2E tests' #take from .env
$PRODUCT_NAME = 'Go Secure E2E tests' #take from .env

def setup_run_artifacts
  FileUtils.mkdir_p("./#{Dir.glob("#{$VALUE}/").max_by {|f| File.mtime(f)}}test_logs")
  FileUtils.mkdir_p("./#{Dir.glob("#{$VALUE}/").max_by {|f| File.mtime(f)}}test_report")
  FileUtils.mkdir_p("./#{Dir.glob("#{$VALUE}/").max_by {|f| File.mtime(f)}}test_results")
  FileUtils.mkdir_p("./#{Dir.glob("#{$VALUE}/").max_by {|f| File.mtime(f)}}test_screenshots") unless File.exist?("./#{Dir.glob("#{$VALUE}/").max_by {|f| File.mtime(f)}}test_screenshots")
end

setup_run_artifacts


def setup_logger(log_name)
  date = Time.new.localtime.strftime('%F %H.%M.%S%L')
  logger = Logger.new("#{$VALUE}/test_logs/#{log_name}_#{date}.log")
  logger.formatter = proc do |severity, datetime, _progname, msg|
    date_format = datetime.strftime('%Y-%m-%d %H:%M:%S%L')
    if (severity == 'INFO') || (severity == 'WARN')
      "[#{date_format}] #{severity}  (#{ENV['PRODUCT_NAME']}): #{msg}\n"
    else
      "[#{date_format}] #{severity} (#{ENV['PRODUCT_NAME']}): #{msg}\n"
    end
  end
  logger
end

def clear_assessments
  puts 'Clearing the assessments'
  conn = PG.connect(dbname: 'go_secure_development')
  conn.exec('delete from scores')
  conn.exec('delete from answers')
  conn.exec('delete from assessments')
end

clear_assessments

ReportBuilder.configure do |config|
  config.json_path = "#{$VALUE}/test_results}"
  config.report_path = "#{$VALUE}/test_report/auto_run_report)}"
  config.report_types = [:json, :html]
  config.report_title = "#{$PRODUCT_NAME} Automation Report"
  config.include_images = true
end


Before do |scenario|
  @log = setup_logger(scenario.name.to_s)
  @log.debug("Starting scenario: #{scenario.name}")

  default_env = 'default'
  temp_env = 'local'
  environment = temp_env.nil? ? default_env : temp_env
  @test_configuration = TestConfiguration.load_configuration environment
  @test_driver = TestDriver.get_instance
  @test_driver.page_timeout @test_configuration.page_timeout
  @test_driver.object_timeout = @test_configuration.object_timeout
end

After do |scenario|
  @log.debug('In after scenario')
  begin
    if scenario.failed?
      @log.error("#{scenario.name} FAILED! => Logging screenshot in #{$VALUE}/test_screenshots")
      screenshot = "#{$VALUE}/test_screenshots/FAILED_#{scenario.name}_#{Time.new.localtime.strftime('%F %H.%M.%S%L')}.png"
      @test_driver.take_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
  ensure
    @log.debug("Something went wrong while capturing the screenshot.")
    @test_driver.quit
  end
end

at_exit do
  FileUtils.mv Dir["#{$target_folder}/*.json"], "#{$VALUE}/test_results", force: true
  options = {
      json_path: "#{$VALUE}/test_results/",
      report_path: "#{$VALUE}/test_report/auto_run_report",
      report_types: [:json, :html],
      report_title: "#{$APPLICATION_NAME} - Automation Report, #{Time.now.strftime('%F %H %M ')}",
      include_images: true
  }
  ReportBuilder.build_report options
end
