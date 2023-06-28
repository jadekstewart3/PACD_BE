require 'rails_helper'

RSpec.describe Item, type: :model do
  context "relationships" do
    it { should have_many :lists }
  end

  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :quantity }
    # note is optional
  end
end
