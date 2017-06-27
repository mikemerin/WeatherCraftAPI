class Daily < ApplicationRecord
  belongs_to :station
  has_many :favorites
end
