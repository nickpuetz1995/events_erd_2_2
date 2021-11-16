class Event < ApplicationRecord
  # Direct associations

  belongs_to :host,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
