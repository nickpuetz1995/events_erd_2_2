class Friend < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :foreign_key => "user_id1"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
