class Diet < ApplicationRecord
  belongs_to :user
  has_many :meal
  
end
