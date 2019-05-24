require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should have_many(:machines).through(:machine_snacks)}
  end

  describe "class methods" do
    it '.average_price' do
      s1 = Snack.create!(name: "candy", price: 3.00)
      s1 = Snack.create!(name: "cookie", price: 0.50)
      s1 = Snack.create!(name: "soda", price: 1.00)
      snacks = Snack.all
      
      expect(snacks.average_price).to eq(1.50)
    end
  end
end
