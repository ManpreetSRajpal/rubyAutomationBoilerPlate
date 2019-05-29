require 'yaml'
require_relative './TestConfig'
require 'object_mapper'

PROPERTY_ROOT = '/Users/manpreetrajpal/Personal/Study/Ruby/myBoilerPlate/config/config.yml'


config_file = File.join(PROPERTY_ROOT)
man = Psych.load_file(config_file)

puts ObjectMapper.convert(man, to: Array(Event))
