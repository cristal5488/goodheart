require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :health_provider => nil,
        :event_name => "Event Name",
        :description => "Description",
        :addres => "Addres",
        :zipcode => "Zipcode",
        :blood_type => "Blood Type",
        :phone => "Phone"
      ),
      Event.create!(
        :health_provider => nil,
        :event_name => "Event Name",
        :description => "Description",
        :addres => "Addres",
        :zipcode => "Zipcode",
        :blood_type => "Blood Type",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Event Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Addres".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "Blood Type".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
