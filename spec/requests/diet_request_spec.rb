require 'rails_helper'

RSpec.describe "Diets", type: :request do
    before do
        @user = User.create(name:"Maida", email:"Maida@infoway.com", password: "draft1", password_confirmation: "draft1")
    end

    describe "GET #Home" do
        it "returns a success response to get Home login ok" do
            post login_path, params: { session:{email:"Maida@infoway.com",password: "draft1"} }
            get home_path
            expect(response).to be_successful
        end
        it "returns a success response if not get Home login fail" do
            post login_path, params: { session:{email:"Maida@infoway.com",password: "1"} }
            get home_path
            expect(response).to redirect_to root_url
        end
    end
    describe "Post #Home" do
        it "returns a success response to create a diet" do
            post login_path, params: { session:{email:"Maida@infoway.com",password: "draft1"} }
            post diet_index_path, params: {diet:{start_date:"2020-03-31", end_date: "2020-03-31", starting_weight: 108, ideal_weight: 80, height: 1.8 }}
            expect(response).to redirect_to home_path
            expect(response.body).not_to match /Dados incompletos ou faltantes/im
        end
    end
end
