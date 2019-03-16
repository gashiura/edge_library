class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 50, null: false
      t.string :password, limit: 50, null: false
      t.string :email, limit: 254, null:false
      t.integer :authority, null: false
      t.timestamps
    end
  end
end
