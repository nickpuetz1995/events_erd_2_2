class EventResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :location, :string
  attribute :host_id, :integer
  attribute :details, :string
  attribute :start_date, :date
  attribute :start_time, :string
  attribute :end_date, :date
  attribute :end_time, :string

  # Direct associations

  # Indirect associations

end
