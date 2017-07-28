class HealthProvidersController < ApplicationController
  before_action :set_health_provider, only: [:edit, :update]

  def new
    @health_provider = HealthProvider.new
  end

  def edit
    set_health_provider
  end

  def create
    @health_provider = HealthProvider.new(health_provider_params)

    if @health_provider.save
      session[:health_provider_id] = @health_provider.id
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @health_provider.update(health_provider_params)
        format.html { redirect_to root_path, notice: 'Health provider was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  def destroy
    @health_provider.destroy
    respond_to do |format|
      format.html { redirect_to health_providers_url, notice: 'Health provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_health_provider
    @health_provider = current_provider
  end

  def health_provider_params
    params.require(:health_provider).permit(:facility_name, :address, :email, :password,:password_confirmation, :webpage, :about_us, :phone)
  end
end
