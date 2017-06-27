class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :station
  belongs_to :daily
end
