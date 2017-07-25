class HealthProvider < ApplicationRecord
  has_secure_password
  has_many :events

  validates_presence_of :facility_name, :address, message: 'this must be completed'
  validates_uniqueness_of :phone_number

  def name
    self.facility_name
  end
end
