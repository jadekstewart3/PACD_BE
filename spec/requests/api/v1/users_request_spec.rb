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

  describe "User#Create" do
    it "can create a new user" do
      user_params = { name: "Bob Beltcher", email: "burgerbob@bobsburgers.com", password: "buttsbuttsbutts" }
      post "/api/v1/users", params: user_params

      expect(response).to be_successful
      expect(User.count).to eq(2)
    end
  end
end