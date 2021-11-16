json.extract! event, :id, :name, :location, :host_id, :details, :start_date,
              :start_time, :end_date, :end_time, :created_at, :updated_at
json.url event_url(event, format: :json)
