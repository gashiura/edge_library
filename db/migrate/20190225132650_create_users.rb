class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid, limit: 50, null: false
      t.string :email, limit: 254, null:false
      t.string :password_digest, limit: 255, null: false
      t.integer :authority, null: false
      t.timestamps
    end
  end
end
