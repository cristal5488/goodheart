require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :health_provider => nil,
      :event_name => "MyString",
      :description => "MyString",
      :address => "MyString",
      :zipcode => "MyString",
      :bloodtype => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[health_provider_id]"

      assert_select "input[name=?]", "event[event_name]"

      assert_select "input[name=?]", "event[description]"

      assert_select "input[name=?]", "event[address]"

      assert_select "input[name=?]", "event[zipcode]"

      assert_select "input[name=?]", "event[bloodtype]"

      assert_select "input[name=?]", "event[phone]"
    end
  end
end
