require 'rails_helper'

RSpec.describe "WeightHistories", type: :request do
    include InitPagesHelper
    before do
        @user = User.create(name:"Maida", email:"Maida@infoway.com", password: "draft1", password_confirmation: "draft1")
    end


    describe "GET #dash" do
        it "returns a success response to get Dashboard" do
            post login_path, params: { session:{email:"Maida@infoway.com",password: "draft1"} }
            get weight_histories_dash_path
            expect(response).to be_successful
        end
        it "returns a success response to get without no user Dashboard" do
            get weight_histories_dash_path 
            expect(response).to redirect_to root_path 
        end
    end
    describe "Post #dash" do
        it "returns a success whith create hist get Dashboard" do
            post login_path, params: { session:{email:"Maida@infoway.com",password: "draft1"} }
            post weight_histories_path, params: {hist:{weighing_date:"2020-02-03",password: 100} }
            expect(response).to redirect_to weight_histories_dash_path
        end
    end
end
