class WeightHistory < ApplicationRecord
  belongs_to :user
  validates :weight, presence: true
  validates :weighing_date, presence: true
  validates_numericality_of :weight, greater_than: 0.0
end
