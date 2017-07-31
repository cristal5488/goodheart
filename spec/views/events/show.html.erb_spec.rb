require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :health_provider => nil,
      :event_name => "Event Name",
      :description => "Description",
      :address => "Address",
      :zipcode => "Zipcode",
      :bloodtype => "Bloodtype",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Event Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Zipcode/)
    expect(rendered).to match(/Bloodtype/)
  end
end
