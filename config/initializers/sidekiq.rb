include Sidekiq::Worker

# Configuratopn for Sidekiq Server
Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_CACHE_URL'] }
end

# Configuration for Sidekiq client
Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_CACHE_URL'] }
end

# Configure Sidekiq cron jobs. Load data from external, YML file
schedule_file = "config/cron_jobs.yml"
if File.exists?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end