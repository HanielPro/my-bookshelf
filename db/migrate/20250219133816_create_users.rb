class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string  :name
      t.boolean :habilitaded, default: true
      t.string  :registration
      t.string  :email
      t.string  :password
      t.timestamps
    end
  end
end
