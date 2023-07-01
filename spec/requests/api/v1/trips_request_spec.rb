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

  describe "Trip#Show" do
    it "returns a single trip" do
      get "/api/v1/trips/#{@trip[:id]}"
      expect(response).to be_successful

      trips = JSON.parse(response.body, symbolize_names: true)
      expect(trips[:data][:id]).to eq("#{@trip[:id]}")

      trips2 = create(:trip)
      get "/api/v1/trips/#{trips2.id}"

      expect(response).to be_successful

      trips = JSON.parse(response.body, symbolize_names: true)
      expect(trips[:data][:id]).to eq("#{trips2.id}")
    end

    it "returns a 404 if trip is not found" do
      get "/api/v1/trips/99999999999"

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("Couldn't find Trip with 'id'=99999999999")
      expect(response.status).to eq(404)
    end
  end
end