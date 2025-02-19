class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.integer :publication_year, default: 2000
      t.string :shelf
      t.integer :quanty, default: 0
      validates :title, :publisher, :quanty, publication_year, presence: true
      t.timestamps
    end
  end
end
