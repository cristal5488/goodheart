class DashboardController < ApplicationController
  before_action :authorize

  def index
    @events = Event.all
  end
end
