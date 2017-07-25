require 'rails_helper'

RSpec.feature "User visiting root", type: :feature do
  # let!(:user) do
  #   fill_in user.email
  #   fill_in user.password
  # end

  it "shows login input form" do
    visit root_path
    fill_in "Email", with: "test@example.com"
    fill_in "password", with: "Testing"
  end

  it 'shows link to donor signup' do
    visit root_path
    click_link "Donor Signup"
    fill_in "First name", with: "Test"
    fill_in "Last name", with: "Test"
    fill_in "Password", with: "Testing"
    fill_in "Password confirmation", with: "Testing"
    fill_in "Zipcode", with: "11111"
    fill_in "Phone", with: "111-111-1111"
    expect(page).to have_select("Bloodtype", options: ["A+", "O+", "B+", "AB+","A-", "O-", "B-", "AB-"])

  end

  it 'shows link to Provider Signup' do
    visit root_path
    click_link "Provider Signup"
    fill_in "Facility name", with: "Test"
    fill_in "Address", with: "Test"
    fill_in "Email", with: "Test"
    fill_in "Password", with: "Testing"
    fill_in "Password confirmation", with: "Testing"
    fill_in "Webpage", with: "Test"
    fill_in "About us", with: "Test"
    fill_in "Phone", with: "1111111111"
  end
end
