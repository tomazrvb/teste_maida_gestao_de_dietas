require 'rails_helper'

RSpec.describe WeightHistory, type: :model do
  before do
    @user = User.create(name:"Maida", email:"Maida@infoway.com", password: "draft1", password_confirmation: "draft1")
  end
  let(:valid_hist) {
    { :weight => 100,:weighing_date => "2020-03-31",:user_id => @user.id} 
  }
  it "Valid WeightHistory with all data" do 
    hist = WeightHistory.create(valid_hist)
    expect(hist).to be_valid
  end
  it "Invalid WeightHistory with incorrect weighing_date data" do
    valid_hist[:weighing_date] =''
    hist = WeightHistory.create(valid_hist)
    expect(hist).not_to be_valid
  end
  it "Invalid WeightHistory with no weighing_date data" do
    valid_hist.delete(:weighing_date)
    hist = WeightHistory.create(valid_hist)
    expect(hist).not_to be_valid
  end
  it "Invalid WeightHistory with no weight data" do
    valid_hist.delete(:weight)
    hist = WeightHistory.create(valid_hist)
    expect(hist).not_to be_valid
  end
  it "Invalid WeightHistory with incorrect weight data" do
    valid_hist[:weight] = -20 
    hist = WeightHistory.create(valid_hist)
    expect(hist).not_to be_valid
  end
end
