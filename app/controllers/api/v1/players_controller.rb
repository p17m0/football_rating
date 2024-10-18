class Api::V1::PlayersController < ApplicationController
  def index
    cache_key = "players/#{params[:team_id]}_#{params[:role_id]}_#{params[:start_date]}_#{params[:end_date]}_limit_#{params[:limit]}"

    players = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      Player.by_team(params[:team_id])
            .by_role(params[:role_id])
            .by_date_range(params[:start_date], params[:end_date])
            .with_total_rating
            .order('total_rating DESC')
            .limit_results(params[:limit])
    end

    render json: players, status: :ok
  end
end
