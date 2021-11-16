class RsvpStatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :event_id, :integer
  attribute :user_id, :integer
  attribute :rsvp_status, :string

  # Direct associations

  belongs_to :user

  # Indirect associations

end
