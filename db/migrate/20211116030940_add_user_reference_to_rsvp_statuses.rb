class AddUserReferenceToRsvpStatuses < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rsvp_statuses, :users
    add_index :rsvp_statuses, :user_id
    change_column_null :rsvp_statuses, :user_id, false
  end
end
