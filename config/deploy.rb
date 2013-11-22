set :rbenv_ruby, File.read('.ruby-version').strip
set :ssh_options, { :forward_agent => false, :user => "develop" }
set :application, "SinatraSkeleton"
set :repo_url, "git@github.com:fguillen/SinatraSkeleton.git"
set :branch, "master"
set :deploy_to, "/var/www/dev.sinatra_skeleton.com"
set :log_level, :debug
set :use_sudo, false
set :keep_releases, 5
