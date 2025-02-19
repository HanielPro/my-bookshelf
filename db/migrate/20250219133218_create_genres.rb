class CreateGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :description
      validates :name, presence: true, uniqueness: true

      t.timestamps
    end
  end
end
