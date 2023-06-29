require 'rails_helper'

RSpec.describe Item, type: :model do
  context "relationships" do
    it { should have_many :lists }
  end

  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :quantity }
    it { should validate_numericality_of(:quantity).is_greater_than(0)}
    # note is optional
  end
end
