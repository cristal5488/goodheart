class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_donor
    @current_donor||= Donor.find_by(id: session[:donor_id]) if session[:donor_id]
  end
  def current_provider
    @current_provider ||= HealthProvider.find_by(id: session[:health_provider_id]) if session[:health_provider_id]
  end

  helper_method :current_donor, :current_provider

  def authorize
    redirect_to login_path unless (current_donor or current_provider)
  end
end
