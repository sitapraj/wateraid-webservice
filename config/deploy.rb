require "bundler/capistrano"

server "192.168.1.1", :web, :app, :db, primary:true

set :application, "wateraid-webservice"
set :user, "surajt"
set :deploy_to, "/home/#{user}/public_html/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository,  "git@devyipl:#{application}.git"
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true

after "deploy", "deploy:clean"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do	
	task :restart, roles: :app do
		run "touch #{current_path}/tmp/restart.txt"	
	end

	task :symlink_config, roles: :app do
		run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
	end
	after "deploy:finalize_update", "deploy:symlink_config"	
end
