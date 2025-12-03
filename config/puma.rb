if Gem.win_platform?
  # Windows dev
  port ENV.fetch("PORT", 3000)
  workers 0
else
  # Linux prod
  app_dir = File.expand_path("../..", __FILE__)
  shared_dir = "#{app_dir}/shared"

  threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
  threads threads_count, threads_count
  workers ENV.fetch("WEB_CONCURRENCY") { 2 }
  preload_app!

  bind "unix://#{shared_dir}/tmp/sockets/puma.sock"
  pidfile "#{shared_dir}/tmp/pids/puma.pid"
  state_path "#{shared_dir}/tmp/pids/puma.state"
  stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true
  activate_control_app
end
