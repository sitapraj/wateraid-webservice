require "bundler/capistrano"
require 'rvm/capistrano'

$:.unshift(File.expand_path("/home/prashant/.rvm/lib"))
set :rvm_ruby_string, 'ruby-1.9.3-p194'
set :rvm_type, :system

server "192.168.1.1", :web, :app, :db, primary:true

set :application, "wateraid-webservice"
set :user, "root"
set :deploy_to, "/home/#{user}/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository,  "git://github.com/surajtamang/#{application}.git"
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:clean"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
	task :start, roles: :app do
		run "gem install passenger"
		run "passenger start -e production -d --user root"	
	end	
	task :restart, roles: :app do
		run "touch #{current_path}/tmp/restart.txt"	
	end

	task :symlink_config, roles: :app do
		run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
	end
	after "deploy:finalize_update", "deploy:symlink_config"	
end
