class AddUsersRelationToTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :types, :user_id, :integer
  end
end
