require 'rails_helper'

RSpec.describe "InitPages", type: :request do
    before do
        @user = User.create(name:"Maida", email:"Maida@infoway.com", password: "draft1", password_confirmation: "draft1")
    end
    describe "GET #index" do
        it "returns a success response to get index" do
            get root_path
            expect(response).to be_successful
        end
    end
    describe "POST #index" do
        it "returns a success response get login" do
            get login_path
            expect(response).to be_successful
        end
        it "returns a success response post corect login" do
            post login_path, params: { session:{email:"Maida@infoway.com",password: "draft1"} }
            expect(response).to redirect_to home_path
        end
        it "not returns a success response post incorect login" do
            post login_path, params: { session:{email:"Maida@infoway.com",password: ""} }
            expect(response.body).to match /Email e\/ou senha invalidos/im
        end
    end
end
