class AddUserReferenceToFriends < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :friends, :users, column: :user_id1
    add_index :friends, :user_id1
    change_column_null :friends, :user_id1, false
  end
end
