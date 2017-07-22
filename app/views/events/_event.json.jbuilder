json.extract! event, :id, :health_provider_id, :event_name, :date, :start_time, :end_time, :description, :addres, :zipcode, :blood_type, :phone, :created_at, :updated_at
json.url event_url(event, format: :json)
