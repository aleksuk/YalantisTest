class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :key
  end
end
