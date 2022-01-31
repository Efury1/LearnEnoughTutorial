class AddResetToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_digest, :string
    add_column :users, :reset_send_at, :datatime
  end
end
