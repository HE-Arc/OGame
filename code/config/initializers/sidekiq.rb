Sidekiq.configure_server do |c|
  c.redis = { url: 'redis://redis' }
end

Sidekiq.configure_client do |c|
  c.redis = { url: 'redis://redis' }
  Rails.application.config.after_initialize do
    UpdateRessourcesWorker.perform_async()
  end
end
