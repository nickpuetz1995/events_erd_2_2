class Event < ApplicationRecord
  # Direct associations

  has_many   :rsvp_statuses,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :host,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
