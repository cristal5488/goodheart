class SessionsController < ApplicationController
  def new
  end

  def create
    user = Donor.find_by_email(params[:email]) || HealthProvider.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if user.role == 'health_provider'
        session[:health_provider_id] = user.id
      else
        session[:donor_id] = user.id
      end
      redirect_to '/'
    else
      if user.nil?
        @error = "Bad email"
      else
        @error = "Bad password"
      end
      render :new
    end
  end

  def destroy
    session[:donor_id] = nil
    session[:health_provider_id] = nil
    # reset_session
    redirect_to '/login'
  end
end
