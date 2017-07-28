require 'rails_helper'

RSpec.describe "analytics/index", type: :view do
  before(:each) do
    assign(:analytics, [
      Analytic.create!(
        :bloodtype => "Bloodtype"
      ),
      Analytic.create!(
        :bloodtype => "Bloodtype"
      )
    ])
  end

  it "renders a list of analytics" do
    render
    assert_select "tr>td", :text => "Bloodtype".to_s, :count => 2
  end
end
