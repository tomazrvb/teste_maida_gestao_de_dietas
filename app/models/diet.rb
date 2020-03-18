class Diet < ApplicationRecord
  belongs_to :user
  has_many :meal, dependent: :destroy
  
end
