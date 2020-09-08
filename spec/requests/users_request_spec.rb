require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET #index" do
    it "has a 200 status code" do
      get users_path
      expect(response.status).to eq(200)
    end

    it "should render the users#index template" do
      # Given - Preconditions
      # When - Action
      get users_path
      # Then - Result
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "should be return a 200 status" do
      user = User.create! username: "Endy", email: "endy@wearesnook.com", password: "insecurepassword"
      get user_url user
      expect(response).to be_successful
    end
  end
end
