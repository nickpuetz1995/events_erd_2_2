class User < ApplicationRecord
  # Direct associations

  has_many   :rsvp_statuses,
             :dependent => :destroy

  has_many   :events,
             :foreign_key => "host_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    id
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
