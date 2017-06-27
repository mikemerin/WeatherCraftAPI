class User < ApplicationRecord
  has_many :favorites
  has_many :stations, through: :favorites
end
