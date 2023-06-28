require "rails_helper"

context "Users API" do
  describe "GET /api/v1/users" do
    it "returns all users" do
      get "/api/v1/users"
      expect(response).to be_successful

      users = JSON.parse(response.body, symbolize_names: true)
    end
  end
end