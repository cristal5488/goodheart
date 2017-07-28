require 'rails_helper'

RSpec.describe "analytics/show", type: :view do
  before(:each) do
    @analytic = assign(:analytic, Analytic.create!(
      :bloodtype => "Bloodtype"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Bloodtype/)
  end
end
