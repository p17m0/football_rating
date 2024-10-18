class Match < ApplicationRecord
  has_many :statistics
  validates :weight, presence: true
end
