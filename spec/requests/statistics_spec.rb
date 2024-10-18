require 'rails_helper'

RSpec.describe "Statistics API", type: :request do
  describe 'POST /api/v1/statistics' do
    let(:role) { Role.create(name: "forward") }
    let(:team) { Team.create(name: "Team 1") }
    let(:player) { Player.create(name: "Player 1", team: team, role: role) }
    let(:match) { Match.create(date: Date.today, weight: 1.5) }

    it 'creates statistic and calculates rating' do
      post '/api/v1/statistics', params: {
        player_id: player.id,
        match_id: match.id,
        statistic: { goals: 2, assists: 1, shots: 5, saves: 0, tackles: 0 }
      }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["rating"]).to eq(19.5)
    end
  end
end
