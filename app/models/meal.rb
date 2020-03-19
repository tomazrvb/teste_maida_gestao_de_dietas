class Meal < ApplicationRecord
    belongs_to :diet
    validates :description, presence: true
    validates :schedule, presence: true
    validates :meal_type, presence: true
end
