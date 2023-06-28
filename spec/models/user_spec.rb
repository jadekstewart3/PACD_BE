require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:user_trips) }
    it { should have_many(:trip).through(:user_trips) }
    it { should have_many(:user_lists) }
    it { should have_many(:lists).through(:user_lists) }
  end

  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }

    it { should validate_uniqueness_of :email }
    it { should have_secure_password }
  end
end
