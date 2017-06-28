class Daily < ApplicationRecord
  belongs_to :station, foreign_key: "wban"
  has_many :favorites
end
