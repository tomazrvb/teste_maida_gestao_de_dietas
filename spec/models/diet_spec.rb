require 'rails_helper'

RSpec.describe Diet, type: :model do
  before do
    @user = User.create(name:"Maida", email:"Maida@infoway.com", password: "draft1", password_confirmation: "draft1")
  end
  let(:valid_diet) {
    { :start_date => "2020-03-31",:end_date => "2020-03-31",:starting_weight => 108,:ideal_weight => 80,:user_id => @user.id,:height => 1.8 } 
  }
  it "Valid Diet with all data" do 
    diet = Diet.create(valid_diet)
    expect(diet).to be_valid
  end
  it "Invalid diet with negative starting weight data" do 
    valid_diet[:starting_weight] = -9
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
  it "Invalid diet with negative ideal weight data" do 
    valid_diet[:ideal_weight] = -9
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
  it "Invalid diet with negative height data" do 
    valid_diet[:height] = -9
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
  it "Invalid diet with blank start_date data" do 
    valid_diet[:start_date] = ""
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
  it "Invalid diet with blank end_date data" do 
    valid_diet[:end_date] = ""
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
  it "Invalid diet with no starting weight data" do 
    valid_diet.delete(:starting_weight)
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
  it "Invalid diet with no ideal weight data" do 
    valid_diet.delete(:ideal_weight)
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
  it "Invalid diet with no height data" do 
    valid_diet.delete(:height)
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
  it "Invalid diet with no start_date data" do 
    valid_diet.delete(:start_date)
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
  it "Invalid diet with no end_date data" do 
    valid_diet.delete(:end_date)
    diet = Diet.create(valid_diet)
    expect(diet).to_not be_valid
  end
end
