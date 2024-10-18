class Api::V1::StatisticsController < ApplicationController
  def create
    player = Player.find(params[:player_id])
    match = Match.find(params[:match_id])

    statistic = player.statistics.new(statistic_params.merge(match: match))

    if statistic.save
      RatingCalculatorWorker.perform_async(statistic.id)
      render json: { success: true, rating: statistic.rating }, status: :created
    else
      render json: { errors: statistic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def statistic_params
      params.require(:statistic).permit(:goals, :assists, :shots, :saves, :tackles)
    end
end
