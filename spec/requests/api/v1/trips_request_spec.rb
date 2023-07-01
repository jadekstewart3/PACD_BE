require "rails_helper"

context "Trips API" do
  before :each do
    @trip = create(:trip)
  end

  describe "Trip#Index" do
    it "returns all trips" do
      get "/api/v1/trips"
      expect(response).to be_successful

      trips = JSON.parse(response.body, symbolize_names: true)
      expect(trips[:data].count).to eq(1)
      expect(trips[:data][0][:attributes][:name]).to eq(@trip.name)
    end
  end
end