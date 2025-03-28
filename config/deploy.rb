# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "pickybitz"
set :repo_url, "git@github.com:nitz8867/pickybitz.git"

# Default deploy_to directory
set :deploy_to, '/home/deploy/pickybitz'

# Set the RVM Ruby version
set :rvm_ruby_version, 'ruby-3.1.0'  # Replace with your Ruby version

# Rails environment
set :rails_env, 'production'

# Linked files and directories
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets public/uploads public/system node_modules}

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
set :branch, 'master'  # Set the branch name you want to deploy

set :default_env, {
  'SECRET_KEY_BASE' => 'c21f386c38b0f5721f1f61eb247dab75e47aa5b82da6b5caf97f6ad77b5c6bf8e4c8e32ab047054f40db9ed6ded660e25a9d9a897f74126d07160de6ae73fed8'
}
