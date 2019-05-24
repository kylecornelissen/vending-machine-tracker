require 'rails_helper'

RSpec.describe "When a user visits a vending machine show page", type: :feature do
  before :each do
    @bob = Owner.create!(name: "bob")

    @vm1 = Machine.create!(location: "kitchen", owner: @bob)

    @s1 = @vm1.snacks.create!(name: "chocolate bar", price: 1.00)
    @s2 = @vm1.snacks.create!(name: "chips", price: 1.25)
    @s3 = @vm1.snacks.create!(name: "cookies", price: 1.50)

  end
  scenario "they see a list of vending machine snacks" do
    visit machine_path(@vm1)

    expect(current_path).to eq(machine_path(@vm1))

    expect(page).to have_content(@s1.name)
    expect(page).to have_content(@s2.name)
    expect(page).to have_content(@s3.name)
    expect(page).to have_content(@s1.price)
    expect(page).to have_content(@s2.price)
    expect(page).to have_content(@s3.price)
  end

  scenario "they see a average price of all vending machine snacks" do
    visit machine_path(@vm1)

    average_price = Snack.average_price

    expect(page).to have_content(average_price)
    save_and_open_page
  end
end
