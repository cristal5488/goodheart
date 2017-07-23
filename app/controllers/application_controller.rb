class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:donor_id].present?
      @current_user||= Donor.find(session[:donor_id])
    elsif session[:health_provider_id].present?
      @current_user ||= HealthProvider.find(session[:health_provider_id])

    end
  end
  helper_method :current_user

  def authorize
    redirect_to'/login' unless current_user
  end
end
