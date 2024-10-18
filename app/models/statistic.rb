class Statistic < ApplicationRecord
  belongs_to :player
  belongs_to :match

  validates :goals, :assists, :shots, :saves, :tackles, presence: true

  after_save :clear_rating_cache

  def rating
    case player.role.name
    when 'goalkeeper'
      saves * 3 + tackles * 1
    when 'forward'
      goals * 3 + assists * 2 + shots * 1
    when 'defender'
      tackles * 3 + saves * 2
    else
      0
    end * match.weight
  end

  private

    def clear_rating_cache
      Rails.cache.delete_matched("players/#{player.team_id}_*_#{player.role_id}_*")
    end
end
