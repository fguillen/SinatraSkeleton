# config.ru
$: << File.expand_path(File.dirname(__FILE__))

ENV["RACK_ENV"] ||= "development"

require "app/sinatra_skeleton"
run SinatraSkeleton::App


