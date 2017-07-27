class HealthProvider < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :analytics

  validates_presence_of :facility_name, :address, message: 'form must be completed'
  validates_uniqueness_of :phone
  validates_uniqueness_of :email


  def name
    self.facility_name
  end

  def has_event?(event)
    event.health_provider == self
  end
end
