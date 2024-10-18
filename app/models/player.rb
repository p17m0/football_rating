class Player < ApplicationRecord
  belongs_to :team
  belongs_to :role
  has_many :statistics, dependent: :destroy

  validates :name, presence: true

  scope :by_team, ->(team_id) { where(team_id: team_id) if team_id.present? }
  scope :by_role, ->(role_id) { where(role_id: role_id) if role_id.present? }
  scope :by_date_range, ->(start_date, end_date) {
    if start_date.present? && end_date.present?
      joins(:statistics).where('statistics.created_at BETWEEN ? AND ?', start_date, end_date)
    end
  }
  scope :with_total_rating, -> {
    joins(:statistics).select('players.*, SUM(statistics.rating) AS total_rating').group('players.id')
  }
  scope :limit_results, ->(limit) { limit(limit || 5) }
end
