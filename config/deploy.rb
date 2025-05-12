# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "pickybitz"
set :repo_url, "git@github.com:nitz8867/pickybitz.git"

# Default deploy_to directory
set :deploy_to, "/var/www/#{fetch(:application)}"

# Set the RVM Ruby version
set :rvm_ruby_version, "ruby-3.1.0"  # Replace with your Ruby version

# Rails environment
set :rails_env, "production"

# Linked files and directories
set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/credentials/production.key")

# Default value for linked_dirs is []
set :linked_dirs, %w[bin log tmp/pids tmp/cache tmp/sockets public/uploads public/system node_modules]

# Set the database configuration
# set :db_adapter, 'postgresql'
# set :db_database, 'your_database_name'
# set :db_username, 'your_database_user'
# set :db_password, 'your_database_password'

# SSH Settings (optional, can be configured in ~/.ssh/config)
# set :ssh_options, {
#   forward_agent: true,
#   user: 'deploy',  # Set your deploy user here
#   keys: %w(/path/to/your/ssh/key),
#   auth_methods: %w(publickey)
# }

namespace :postgresql do
  task :started do
    # Custom logic for checking PostgreSQL status
  end
end

# Configure your branches
set :branch, "master"  # Set the branch name you want to deploy

set :default_env, {
  "SECRET_KEY_BASE" => "73bbd28e823beb0d957fc6d11796bcd88c0a5b0591fa501d0880f7a397fe6521020bbc5ee255c9f883dea8673ad1ad4f308fe1475832e0b4b7081a2d248aefc5"
}

# Puma configuration

set :puma_threads, [ 4, 16 ]
set :puma_workers, 2
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_daemonize, false
set :puma_prune_bundler, true
