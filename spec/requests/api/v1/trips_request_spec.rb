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

  describe "Trip#Create" do
    it "can create a new trip" do
      trip_params = { name: "The Warf", start_date: "2021-08-01", end_date: "2021-08-10" }
      post "/api/v1/trips", params: trip_params

      expect(response).to be_successful
      expect(Trip.count).to eq(2)
    end

    it "returns a 400 if trip is not created" do
      trip_params = { start_date: "2021-08-01", end_date: "2021-08-10" }
      post "/api/v1/trips", params: trip_params

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("Validation failed: Name can't be blank")
      expect(response.status).to eq(400)
    end
  end

  describe "Trip#Update" do
    it "can update a trip" do
      trip_params = { name: "The Warf", start_date: "2021-08-01", end_date: "2021-08-10" }
      patch "/api/v1/trips/#{@trip[:id]}", params: trip_params

      expect(response).to be_successful
      trip = JSON.parse(response.body, symbolize_names: true)
      expect(trip[:data][:attributes][:name]).to eq("The Warf")
    end
  end

  describe "Trip#Destroy" do
    it "can destroy a trip" do
      delete "/api/v1/trips/#{@trip[:id]}"

      expect(response).to be_successful
      expect(Trip.count).to eq(0)
    end

    it "returns a 404 if trip is not found" do
      delete "/api/v1/trips/99999999999"

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("Couldn't find Trip with 'id'=99999999999")
    end
  end
end