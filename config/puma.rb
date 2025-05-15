# Change to match your CPU core count
workers Integer(ENV["WEB_CONCURRENCY"] || 2)

# Min and Max threads per worker
threads_count = Integer(ENV["RAILS_MAX_THREADS"] || 5)
threads threads_count, threads_count

preload_app!

environment ENV.fetch("RAILS_ENV") { "development" }

# Set up socket location
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

bind "unix://#{shared_dir}/tmp/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.access.log", "#{shared_dir}/log/puma.error.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/tmp/pids/puma.pid"
state_path "#{shared_dir}/tmp/pids/puma.state"
activate_control_app

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
