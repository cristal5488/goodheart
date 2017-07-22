require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :health_provider => nil,
        :event_name => "Event Name",
        :description => "Description",
        :address => "Address",
        :zipcode => "Zipcode",
        :bloodtype => "Bloodtype",
        :phone => "Phone"
      ),
      Event.create!(
        :health_provider => nil,
        :event_name => "Event Name",
        :description => "Description",
        :address => "Address",
        :zipcode => "Zipcode",
        :bloodtype => "Bloodtype",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Event Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "Bloodtype".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
