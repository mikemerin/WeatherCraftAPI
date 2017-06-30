class Station < ApplicationRecord
  has_many :hourlies, primary_key: "wban", foreign_key: "wban"
  has_many :dailies, primary_key: "wban", foreign_key: "wban"
  has_many :monthlies, primary_key: "wban", foreign_key: "wban"
  has_many :favorites

  validates :wban, presence: true, uniqueness: true
end
