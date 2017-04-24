Sidekiq.configure_server do |c|
  c.redis = { url: 'redis://127.0.0.1' }
end

Sidekiq.configure_client do |c|
  c.redis = { url: 'redis://127.0.0.1' }
  Rails.application.config.after_initialize do
    UpdateRessourcesWorker.perform_async()
  end
end
