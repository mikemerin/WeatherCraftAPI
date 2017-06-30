class Daily < ApplicationRecord
  belongs_to :station, primary_key: "wban", foreign_key: "wban"
  has_many :favorites
end
