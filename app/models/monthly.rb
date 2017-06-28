class Monthly < ApplicationRecord
  belongs_to :station, foreign_key: "wban"
end
