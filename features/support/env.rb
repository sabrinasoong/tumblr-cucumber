require 'cucumber'
require 'watir'
require 'pry'
require 'rspec/expectations'
require 'yaml'

#require File.join(File.dirname(__FILE__), '..', '..', 'data', 'tumblr_login_data')
Dir["../pages/*_page.rb"].each {|file| require file}

CONFIG = YAML::load_file("data/tumblr_login_data.yml")
