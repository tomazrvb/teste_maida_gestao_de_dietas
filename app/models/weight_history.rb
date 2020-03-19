class WeightHistory < ApplicationRecord
  belongs_to :user
  validates :weight, presence: true
  validates :weighing_date, presence: true
end
