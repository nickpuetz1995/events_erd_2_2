class User < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :friends,
             :foreign_key => "user_id1",
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

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
