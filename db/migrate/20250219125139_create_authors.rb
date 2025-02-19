class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birthdate
      t.timestamps
      validates :name, presence: true
      validates :birthdate, presence: true
    end
  end
end
