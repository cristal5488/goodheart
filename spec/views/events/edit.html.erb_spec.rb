require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :health_provider => nil,
      :event_name => "MyString",
      :description => "MyString",
      :addres => "MyString",
      :zipcode => "MyString",
      :blood_type => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[health_provider_id]"

      assert_select "input[name=?]", "event[event_name]"

      assert_select "input[name=?]", "event[description]"

      assert_select "input[name=?]", "event[addres]"

      assert_select "input[name=?]", "event[zipcode]"

      assert_select "input[name=?]", "event[blood_type]"

      assert_select "input[name=?]", "event[phone]"
    end
  end
end
