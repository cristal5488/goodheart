class HealthProvider < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :analytics

  validates_presence_of :facility_name, :address, message: 'this must be completed'

  def name
    self.facility_name
  end
end
