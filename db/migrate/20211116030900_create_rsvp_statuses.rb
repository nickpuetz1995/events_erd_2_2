class CreateRsvpStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :rsvp_statuses do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :rsvp_status

      t.timestamps
    end
  end
end
