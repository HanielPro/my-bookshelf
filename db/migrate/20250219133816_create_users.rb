class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :habilitaded, default: true
      t.string :role
      t.string :email
      t.string :password

      validates :email, :name, :role, :password, presence: true
      validates :email, :role, uniqueness: true

      t.timestamps
    end
  end
end
