set :application, "localserver.yipl.com.np"
set :repository,  "git@192.168.1.1:wateraid-webservice.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'surajt'
set :use_sudo, true
set :deploy_to, "/home/surajt/public_html/#{application}"

role :web, "localserver.yipl.com.np"                          # Your HTTP server, Apache/etc
role :app, "localserver.yipl.com.np"                          # This may be the same as your `Web` server
role :db,  "localserver.yipl.com.np", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
	 task :bundle_gems do
   	run "cd #{deploy_to}/current && bundle install vender/gems"
	 end
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
