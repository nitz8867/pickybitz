# Paths
app_dir = "/home/deploy/pickybitz/current"
shared_dir = "/home/deploy/pickybitz/shared"

# Socket for Nginx to talk to
bind "unix://#{shared_dir}/tmp/sockets/puma.sock"

# Puma state and PID files
state_path "#{shared_dir}/tmp/pids/puma.state"
pidfile "#{shared_dir}/tmp/pids/puma.pid"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Puma workers and threads (tune based on your server)
threads 1, 6
workers 2

# Preload app for better memory usage
preload_app!
