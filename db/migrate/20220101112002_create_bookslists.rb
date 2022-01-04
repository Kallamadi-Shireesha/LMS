class CreateBookslists < ActiveRecord::Migration
  def change
    create_table :bookslists do |t|
      t.string :bookname
      t.text :description
      t.integer :user_id
     
      t.timestamps null: false
    end
  end
end
