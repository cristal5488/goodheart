class DashboardController < ApplicationController
  before_action :authorize

  def index
    if current_provider == 'health_provider'
      @events = current_user.events.all
    else
      @events = Event.all
    end
  end
end
