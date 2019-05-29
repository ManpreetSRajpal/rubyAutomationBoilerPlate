require 'cucumber/rake/task'
require 'fileutils'
require 'cucumber'
require 'report_builder'

task default: 'all'

desc 'Running test tagged with @smoke'
Cucumber::Rake::Task.new(:smoke, 'Runs the smoke test suite') do |t|
  t.cucumber_opts = "./
    --format html --out=test_artifacts/smoke-report-#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}.html
    --format pretty --no-source
    --format rerun --out test_artifacts/smoke-rerun.txt
    --tag @smoke"
end

task :report_builder, [:json_path, :report_path] do |_t, args|
  args.with_defaults(json_path: 'test_artifacts/Automation/test_results/', report_path: 'test_artifacts/Automation/test_report/auto_run_report')
  options = {json_path: args.json_path, report_path: args.report_path}
  ReportBuilder.build_report options
end