class Donor < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :phone
  validates_uniqueness_of :email
  validates_presence_of :bloodtype, message: 'Blood type is required'
  validates_uniqueness_of :phone, :email

  def name
    # self.first_name + '' + self.last_name
    return [self.first_name, self.last_name].map(&:capitalize).join(" ")
  end
end
