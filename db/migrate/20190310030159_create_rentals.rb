class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :book, null: false
      t.references :user, null: false
      t.string :status, limit: 10, null: false
      t.datetime :checkout_date, null: false
      t.string :checkout_approver, limit: 30, null: false
      t.datetime :return_due_date, null: false
      t.datetime :return_date
      t.string :return_approver, limit: 30
      t.timestamps
    end
  end
end
