require 'rails_helper'

RSpec.describe List, type: :model do
  context "associations" do
    it { should belong_to(:trip) }
    it { should have_many(:items) }
  end
end
