$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__), '/budget')

require 'byebug'
require 'yaml'

require 'calendar.rb'
require 'month.rb'
require 'day.rb'
require 'balance.rb'

settings_file = File.join(File.dirname(__FILE__), "../settings.yml")
SETTINGS = YAML.parse_file(settings_file).to_ruby
