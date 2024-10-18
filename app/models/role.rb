class Role < ApplicationRecord
  has_many :players
  validates :name, presence: true
end
