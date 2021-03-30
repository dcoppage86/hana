class AddUidToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :numeric
  end
end
