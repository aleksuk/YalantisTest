class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :key

      t.timestamps null: false
    end
  end
end
