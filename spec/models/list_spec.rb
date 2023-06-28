require 'rails_helper'

RSpec.describe List, type: :model do
  context "associations" do
    it { should belong_to(:trip) }
    it { should have_many(:items) }
  end

  context "validations" do
    it { should validate_presence_of :title }
    # description is optional
  end
end
