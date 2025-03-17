class CreateRentals < ActiveRecord::Migration[8.0]
  def change
    create_table :rentals do |t|
      t.date :rental_date
      t.date :return_date
      t.date :return_estimate_date
      t.string :rental_status, default: "ativo"
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_check_constraint :rentals, "rental_date <= return_estimate_date", name: "rental_date_must_be_before_return_estimate_date"
  end
end
