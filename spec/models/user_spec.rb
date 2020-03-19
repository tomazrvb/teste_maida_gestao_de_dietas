require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) {
    { :name => "Maida", :email => "Maida@infoway.com", :password => "draft1",:password_confirmation => "draft1" }
  }
  
  it "Valid user with all data" do 
    user = User.create(valid_user)
    expect(user).to be_valid
  end
  it "Invalid user with wrong email format data" do 
    valid_user[:email] = "maida"
    user = User.create(valid_user)
    expect(user).to_not be_valid
  end
  it "Invalid user with password less 6 minimum charactere" do 
    valid_user[:password] = "maida"
    valid_user[:password_confirmation] = "maida"
    user = User.create(valid_user)
    expect(user).to_not be_valid
  end
  it "Invalid user with password different password confirmation" do 
    valid_user[:password] = "maida1"
    valid_user[:password_confirmation] = "maida2"
    user = User.create(valid_user)
    expect(user).to_not be_valid
  end
  it "Invalid user with blanck name" do 
    valid_user[:name] = ""
    user = User.create(valid_user)
    expect(user).to_not be_valid
  end
  it "Invalid user with same email" do 
    user = User.create(valid_user)
    invalid_user = { :name => "Maida", :email => valid_user[:email], :password => "draft1",:password_confirmation => "draft1" }
    user2 = User.create(invalid_user)
    expect(user2).to_not be_valid
  end 
  it "Invalid user with no email" do 
    valid_user.delete(:email)
    user = User.create(valid_user)
    expect(user).to_not be_valid
  end
  it "Invalid user with no password" do 
    valid_user.delete(:password)
    user = User.create(valid_user)
    expect(user).to_not be_valid
  end
  it "Invalid user with no name" do 
    valid_user.delete(:name)
    user = User.create(valid_user)
    expect(user).to_not be_valid
  end

end
