module SinatraSkeleton
  class App < Sinatra::Base
    use Rollbar::Middleware::Sinatra
    register Sinatra::ActiveRecordExtension

    configure do
      set :sessions, :expire_after => 2592000, :key => "SinatraSkeleton" unless test?
      set :session_secret, "SinatraSkeleton"
      set :layout => :layout
      set :logging, true
      set :root, File.dirname(__FILE__)
      set :views, Proc.new { "#{root}/../../views" }
      set :public_folder, Proc.new { "#{root}/../../public" }
      set :database_file, "#{root}/../../config/database.yml"
    end

    configure :development, :staging, :production do
      # console log to file
      log_path = "#{root}/../../log"
      Dir.mkdir(log_path) unless File.exist?(log_path)
      log_file = File.new("#{log_path}/#{settings.environment}.log", "a+")
      log_file.sync = true
      # $stdout.reopen(log_file) # Reopening STDOUT causes problems with Passenger
      $stderr.reopen(log_file)
    end

    get "/" do
      @message = SinatraSkeleton::APP_CONFIG["message"]
      erb :hello_world
    end

    get "/other_page" do
      erb :other_page
    end

    get "/error" do
      raise "This is a test error"
    end

    get "/visit" do
      SinatraSkeleton::Visit.create!(:datestamp => Time.now)
    end
  end
end
