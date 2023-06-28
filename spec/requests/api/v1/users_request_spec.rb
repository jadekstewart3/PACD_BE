require "rails_helper"

context "Users API" do
  before :each do
    @user = create(:user)
  end
  
  describe "GET /api/v1/users" do
    it "returns all users" do
      get "/api/v1/users"
      expect(response).to be_successful

      users = JSON.parse(response.body, symbolize_names: true)
      expect(users[:data].count).to eq(1)
      expect(users[:data][0][:attributes][:name]).to eq(@user.name)
    end
  end
end