class DashboardController < ApplicationController
  before_action :authorize

  def index
    @events = if current_provider
                current_provider.events
              else
                Event.all
              end
  end
end
