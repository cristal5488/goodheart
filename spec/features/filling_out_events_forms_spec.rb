require 'rails_helper'
require 'support/login_helper'

RSpec.feature "FillingOutEventsForms", type: :feature do
  include LoginHelper

  let!(:provider) do
    login_provider
  end

  it "Health provider profile" do
    expect(page).to have_content("I'm a health provider")
    expect(page).to have_content provider.facility_name
    expect(page).to have_content provider.address
    expect(page).to have_content provider.email
    expect(page).to have_content("Events")

  end

  it "takes you to create new event" do
    click_link 'New Event'
    visit events_new_path
    expect(page).to have_content("New Event")

  end
  let(:event) do
    Event.create(
    event_name: "blood donation",
    description: "donating blood",
    address: "2308 nw 66th dr",
    zipcode: "33496",
    bloodtype: "all",
    phone: "561-789-3962",
    )
    fill_in 'Event name', with: event.event_name
    fill_in 'Description', with: event.description
    fill_in 'Address', with: event.address
    fill_in 'Zipcode', with: event.bloodtype
    fill_in 'Phone', with: event.phone
    expect(page).to have_link("Create Event")
    expect(page).to have_link("Back")
    click_link 'Create Event'
    visit event

  end

  it "Event show page" do
    # visit event
    # expect(page).to have_content("Event was successfully created")
    expect(page).to have_content("Health provider")
    expect(page).to have_content("Date")
    expect(page).to have_content("Start time")
    expect(page).to have_content("End time")
    expect(page).to have_content("Description")
    expect(page).to have_content("Address")
    expect(page).to have_content("Zipcode")
    expect(page).to have_content("Bloodtype")
    expect(page).to have_content("Phone")
    # expect(page).to have_link("Edit")
    # expect(page).to have_link("Back")
    # click_link 'Back'
  end
end
