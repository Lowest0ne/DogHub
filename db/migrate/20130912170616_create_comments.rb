class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email, null: false
      t.string :description, null: false
      t.text :description, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps
    end
  end
end
