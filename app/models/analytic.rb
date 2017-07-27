class Analytic < ApplicationRecord
  belongs_to :health_provider
  belongs_to :event 
end
