require 'rails_helper'

RSpec.describe "analytics/new", type: :view do
  before(:each) do
    assign(:analytic, Analytic.new(
      :bloodtype => "MyString"
    ))
  end

  it "renders new analytic form" do
    render

    assert_select "form[action=?][method=?]", analytics_path, "post" do

      assert_select "input[name=?]", "analytic[bloodtype]"
    end
  end
end
