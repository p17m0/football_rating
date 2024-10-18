class RatingCalculatorWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default', retry: true

  def perform(statistic_id)
    statistic = Statistic.find(statistic_id)
    calculated_rating = statistic.rating
    statistic.update(rating: calculated_rating)
  end
end
