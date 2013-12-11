module SinatraSkeleton
  class App < Sinatra::Base
    configure do
      set :sessions, true
      set :session_secret, "SinatraSkeleton"
      set :layout => :layout
      set :logging, true
      set :root, File.dirname(__FILE__)
      set :views, Proc.new { "#{root}/../../views" }
      set :public_folder, Proc.new { "#{root}/../../public" }
    end

    configure :development, :staging, :production do
      # console log to file
      log_path = "#{root}/../../log"
      Dir.mkdir(log_path) unless File.exist?(log_path)
      log_file = File.new("#{log_path}/#{settings.environment}.log", "a+")
      log_file.sync = true
      $stdout.reopen(log_file)
      $stderr.reopen(log_file)
    end

    get "/" do
      @message = SinatraSkeleton::APP_CONFIG["message"]
      erb :hello_world
    end

    get "/other_page" do
      erb :other_page
    end
  end
end