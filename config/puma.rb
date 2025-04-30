# config/puma.rb

# Paths
app_dir = "/home/deploy/pickybitz/current"
shared_dir = "/home/deploy/pickybitz/shared"

# Puma configuration
directory app_dir
rackup "#{app_dir}/config.ru"
environment ENV.fetch("RAILS_ENV") { "production" }

# Socket for Nginx to talk to
bind "unix://#{shared_dir}/tmp/sockets/puma.sock"

# Puma state and PID files
state_path "#{shared_dir}/tmp/pids/puma.state"
pidfile "#{shared_dir}/tmp/pids/puma.pid"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Puma workers and threads (tune based on your server)
workers 2
threads 4, 16

# Preload app for better memory usage
preload_app!

# Restart workers on memory leaks
worker_timeout 60 if ENV.fetch("RAILS_ENV", "development") == "development"
