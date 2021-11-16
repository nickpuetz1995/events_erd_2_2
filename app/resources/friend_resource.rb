class FriendResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id1, :integer
  attribute :user_id2, :integer

  # Direct associations

  belongs_to :user,
             foreign_key: :user_id1

  # Indirect associations

end
