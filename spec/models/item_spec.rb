require 'rails_helper'

RSpec.describe Item, type: :model do
  context "relationships" do
    it { should have_many :list_items }
    it { should have_many(:lists).through(:list_items)}
  end
end
