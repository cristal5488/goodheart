class HealthProvider < ApplicationRecord
  has_secure_password
  has_many :events

  validates_presence_of :facility_name, :address, message: 'this must be completed'
  validates_uniqueness_of :phone

  def name
    self.facility_name
  end

  def has_event?(event)
    event.health_provider == self
  end
end
