require "rails_helper"

context "Users API" do
  before :each do
    @user = create(:user)
  end
  
  describe "User#Index" do
    it "returns all users" do
      get "/api/v1/users"
      expect(response).to be_successful

      users = JSON.parse(response.body, symbolize_names: true)
      expect(users[:data].count).to eq(1)
      expect(users[:data][0][:attributes][:name]).to eq(@user.name)
    end
  end

  describe "User#Show" do
    it "returns a single user" do
      get "/api/v1/users/#{@user[:id]}"
      expect(response).to be_successful

      users = JSON.parse(response.body, symbolize_names: true)
      expect(users[:data][:id]).to eq("#{@user.id}")

      user2 = create(:user)
      get "/api/v1/users/#{user2.id}"

      expect(response).to be_successful

      users = JSON.parse(response.body, symbolize_names: true)
      expect(users[:data][:id]).to eq("#{user2.id}")
    end
  end
end