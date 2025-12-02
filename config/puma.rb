# Número de threads
threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
threads threads_count, threads_count

# Número de workers (processos). Pode deixar 1 se o servidor for pequeno
workers ENV.fetch("WEB_CONCURRENCY", 1)

# Diretórios
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Porta (fallback)
port ENV.fetch("PORT", 3000)

# Socket para o NGINX
bind "unix://#{shared_dir}/tmp/sockets/puma.sock"

# PID e STATE
pidfile "#{shared_dir}/tmp/pids/puma.pid"
state_path "#{shared_dir}/tmp/pids/puma.state"

# Logs
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Preload app
preload_app!

# Permite restart com systemctl / pumactl
activate_control_app