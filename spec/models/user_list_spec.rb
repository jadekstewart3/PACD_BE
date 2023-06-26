require 'rails_helper'

RSpec.describe UserList, type: :model do
  context "associations" do
    it { should belong_to(:list) }
    it { should belong_to(:user) }
  end
end
