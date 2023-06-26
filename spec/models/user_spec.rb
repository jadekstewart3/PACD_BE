require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:user_trips) }
    it { should have_many(:trip).through(:user_trips) }
    it { should have_many(:user_lists) }
    it { should have_many(:lists).through(:user_lists) }
  end
end
