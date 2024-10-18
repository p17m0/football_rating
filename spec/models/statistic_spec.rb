require 'rails_helper'

RSpec.describe Statistic, type: :model do
  let(:role) { Role.create(name: "forward") }
  let(:team) { Team.create(name: "Team 1") }
  let(:player) { Player.create(name: "Player 1", team: team, role: role) }
  let(:match) { Match.create(date: Date.today, weight: 1.5) }
  let(:statistic) { Statistic.new(player: player, match: match, goals: 2, assists: 1, shots: 5, saves: 0, tackles: 0) }

  it 'calculates rating correctly' do
    expect(statistic.rating).to eq(19.5)
  end
end
