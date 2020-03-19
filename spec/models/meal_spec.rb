require 'rails_helper'

RSpec.describe Meal, type: :model do
  before do
    @user = User.create(name:"Maida", email:"Maida@infoway.com", password: "draft1", password_confirmation: "draft1")
    @diet = Diet.create(start_date: "2020-03-31",end_date: "2020-03-31",starting_weight: 108,ideal_weight: 80,user_id: @user.id,height: 1.8)
  end
  let(:valid_meal) {
    { :schedule => "04:00",:meal_type => "Lanche",:description => " Bla Bla Bla",:diet_id => @diet.id } 
  }
  it "Valid meal with all data" do 
    diet = Meal.create(valid_meal)
    expect(diet).to be_valid
  end

  it "Invalid meal with no schedule data" do 
    valid_meal.delete(:schedule)
    diet = Meal.create(valid_meal)
    expect(diet).not_to be_valid
  end

  it "Invalid meal with no meal_type data" do 
    valid_meal.delete(:meal_type)
    diet = Meal.create(valid_meal)
    expect(diet).not_to be_valid
  end

  it "Invalid meal with no description data" do 
    valid_meal.delete(:description)
    diet = Meal.create(valid_meal)
    expect(diet).not_to be_valid
  end

end
