class AddUserToContacts < ActiveRecord::Migration[5.1]
  def change
    remove_column :contacts, :user_id, :integer
    add_reference :contacts, :user, foreign_key: true
  end
end
