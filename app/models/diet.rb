class Diet < ApplicationRecord
  belongs_to :user
  has_many :meal, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :starting_weight, presence: true
  validates :ideal_weight, presence: true
  validates :height, presence: true
end
