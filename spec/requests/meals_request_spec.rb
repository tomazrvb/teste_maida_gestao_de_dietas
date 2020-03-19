require 'rails_helper'

RSpec.describe "Meals", type: :request do
    before do
        @user = User.create(name:"Maida", email:"Maida@infoway.com", password: "draft1", password_confirmation: "draft1")
        @diet = Diet.create(start_date: "2020-03-31",end_date: "2020-03-31",starting_weight: 108,ideal_weight: 80,user_id: @user.id,height: 1.8)
      end
      let(:valid_meal) {
        { :schedule => "04:00",:meal_type => "1",:description =>" Bla Bla Bla"} 
      }

    describe "POST #index" do
        it "returns a success if response can create a meal" do
            post login_path, params: { session:{email:"Maida@infoway.com",password: "draft1"} }
            post meals_path, params: { meal:valid_meal }
            expect(response).to redirect_to home_path
            expect(response.body).not_to match /Dados incompletos ou faltantes/im
        end
    end
end
