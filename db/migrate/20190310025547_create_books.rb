class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, limit: 200, null: false
      t.string :eg_id, limit:10, null: false
      t.string :author, limit:255, null:false
      t.text :description, null: false
      t.string :publisher, limit: 255, null: false
      t.string :category, limit: 10, null: false
      t.json :tags, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
