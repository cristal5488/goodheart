class DonorsController < ApplicationController
   validates_uniqueness_of :email, :password

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      session[:donor_id] = @donor.id
      redirect_to '/'
    else
      render :new
    end
  end


  private
  def donor_params
    params.require(:donor).permit(:first_name,:last_name, :email, :password, :password_confirmation, :zipcode, :phone, :bloodtype)
  end
end
