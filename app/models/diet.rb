class Diet < ApplicationRecord
  belongs_to :user
  has_many :meal, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :starting_weight, presence: true
  validates :ideal_weight, presence: true
  validates :height, presence: true
  validates_numericality_of :height, greater_than: 0.0
  validates_numericality_of :starting_weight, greater_than: 0.0
  validates_numericality_of :ideal_weight, greater_than: 0.0
end
