class Event < ApplicationRecord
  belongs_to :health_provider
  has_many :analytics
end
