preload_app true
timeout 15
worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master received TERM, QUIT-ing'
    Process.kill 'QUIT', Process.pid
  end

  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
end

after_fork do |server, worker|
  Signal.trap 'TERM'  do
    puts "Unicorn worker received TERM, doing nothing"
  end

  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)

  Rails.cache.reset if Rails.cache.respond_to?(:reset)
end
