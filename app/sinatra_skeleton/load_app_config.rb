require "yaml"

module SinatraSkeleton
  APP_CONFIG = YAML.load(File.read("#{File.dirname(__FILE__)}/../../config/app_config.yml"))[ENV['RACK_ENV']]
end