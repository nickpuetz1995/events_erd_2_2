class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string
  attribute :user_name, :string

  # Direct associations

  has_many   :friends,
             foreign_key: :user_id1

  has_many   :comments

  has_many   :rsvp_statuses

  has_many   :events,
             foreign_key: :host_id

  # Indirect associations
end
