require 'rails_helper'

RSpec.describe UserTrip, type: :model do
  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:trip) }
  end
end
