require 'rails_helper'

RSpec.describe "Users", type: :request do

    describe "GET #User" do
        it "returns a success with get create viw" do
            get new_user_path
            expect(response).to be_successful
        end
    end
    describe "Post #User" do
        it "returns a success with get create viw" do
            post users_path, params: { user:{ :name => "Maida", :email => "maida-healt@infoway.com", :password => "draft1",:password_confirmation => "draft1" }}
            expect(response).to redirect_to home_path
        end
        it "returns a success with get create viw" do
            post users_path, params: { user:{ :name => "Maida", :password => "draft1",:password_confirmation => "draft1" }}
            expect(response.body).to match /Dados incompletos ou faltantes/im
        end
    end
end
