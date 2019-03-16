class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites, id: false  do |t|
      t.references :book, unique: true
      t.references :user, unique: true

      t.timestamps
    end
  end
end
