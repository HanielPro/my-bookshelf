class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :publisher
      t.integer :year_published, default: 2000, null: false
      t.string :shelf
      t.integer :quanty, default: 0, null: false
      t.timestamps
    end
  end
end
