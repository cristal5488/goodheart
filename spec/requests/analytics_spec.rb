require 'rails_helper'

RSpec.describe "Analytics", type: :request do
  describe "GET /analytics" do
    it "works! (now write some real specs)" do
      get analytics_path
      expect(response).to have_http_status(200)
    end
  end
end
