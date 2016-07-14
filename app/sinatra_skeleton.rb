require "sinatra/base"
require "json"
require "rollbar"
require "rollbar/middleware/sinatra"

require_relative "../lib/rollbar_initializer"
require_relative "sinatra_skeleton/app"
require_relative "sinatra_skeleton/load_app_config"


module SinatraSkeleton
end