class Station < ApplicationRecord
  has_many :hourlies
  has_many :dailies
  has_many :monthlies, primary_key: "wban", foreign_key: "wban"
  has_many :favorites

  validates :wban, presence: true, uniqueness: true
end
