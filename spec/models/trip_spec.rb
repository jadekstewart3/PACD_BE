require 'rails_helper'

RSpec.describe Trip, type: :model do
  context "associations" do
    it { should have_many(:lists) }
    it { should have_many(:user_trips) }
    it { should have_many(:users).through(:user_trips) }
  end

  context "validations" do
    it { should validate_presence_of :name }
  end
end
