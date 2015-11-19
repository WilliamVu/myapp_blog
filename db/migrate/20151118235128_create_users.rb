class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :gender
      t.string :address
      t.string :phone
      t.string :based_in
      t.string :ages
      t.text :about_me
      t.string :profile_image_id
      t.integer :status, null: false, default: 0
      t.integer :role, null: false, default: 0

      t.timestamps null: false
    end
  end
end