class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :book, null: false
      t.references :user, null: false
      t.text :content, null: false
      t.integer :point, limit: 1, null: false

      t.timestamps
    end
  end
end
