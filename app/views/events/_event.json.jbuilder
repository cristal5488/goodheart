json.extract! event, :id, :health_provider_id, :event_name, :date, :start_time, :end_time, :description, :address, :zipcode, :bloodtype, :phone, :created_at, :updated_at
json.url event_url(event, format: :json)
