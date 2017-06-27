class Station < ApplicationRecord
  has_many :hourlies
  has_many :dailies
  has_many :monthlies
  has_many :favorites
  has_many :users, through: :favorites
end
