require 'rails_helper'

RSpec.describe Item, type: :model do
  context "relationships" do
    it { should have_many :lists }
  end
end
