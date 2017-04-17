class UpdateRessourcesWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    User.update_ressources
    UpdateRessourcesWorker.perform_in(1.minutes)
  end
end
