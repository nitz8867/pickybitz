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
append :linked_files, 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp', 'public/system', 'public/uploads', 'vendor/bundle', 'node_modules'

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

namespace :deploy do
  task :install_nokogiri_dependencies do
    on roles(:app) do
      execute "sudo apt-get update && sudo apt-get install -y libxml2-dev libxslt1-dev zlib1g-dev"
    end
  end

  
  task :install_nokogiri do
    on roles(:app) do
      within release_path do
        execute :bundle, "install --with nokogiri --deployment"
      end
    end
  end
  
  before 'deploy:install_nokogiri', 'deploy:install_nokogiri_dependencies'
  after :finishing, 'deploy:install_nokogiri'
end



namespace :postgresql do
  task :started do
    # Custom logic for checking PostgreSQL status
  end
end

# Configure your branches
set :branch, 'master'  # Set the branch name you want to deploy
