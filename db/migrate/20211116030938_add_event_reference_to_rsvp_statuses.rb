class AddEventReferenceToRsvpStatuses < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rsvp_statuses, :events
    add_index :rsvp_statuses, :event_id
    change_column_null :rsvp_statuses, :event_id, false
  end
end
