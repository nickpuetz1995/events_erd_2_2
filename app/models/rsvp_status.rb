class RsvpStatus < ApplicationRecord
  # Direct associations

  belongs_to :event

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event.to_s
  end
end
