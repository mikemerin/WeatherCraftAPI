class Hourly < ApplicationRecord
  belongs_to :station, foreign_key: "wban"
end
