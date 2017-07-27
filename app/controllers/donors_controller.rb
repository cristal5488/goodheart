class DonorsController < ApplicationController
  before_action :set_donor, only: [:edit, :update]

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      session[:donor_id] = @donor.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @donor.update(donor_params)
      redirect_to root_path, notice: 'Donor was successfully updated.'
    else
      render :edit
    end
  end


  private
  def donor_params
    params.require(:donor).permit(
    :first_name,
    :last_name,
    :email,
    :password,
    :password_confirmation,
    :zipcode,
    :phone,
    :bloodtype,
    )
  end

  def set_donor
    @donor = current_donor
  end
end
