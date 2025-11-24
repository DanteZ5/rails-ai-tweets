class Tweet < ApplicationRecord
  validates :shortened, length: { maximum: 280 }
end
