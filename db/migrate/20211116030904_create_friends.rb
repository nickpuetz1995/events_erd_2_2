class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :user_id1
      t.integer :user_id2

      t.timestamps
    end
  end
end
