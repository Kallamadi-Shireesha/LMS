class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :bookslist_id
      t.string :bookname
      t.text :description

      t.timestamps null: false
    end
  end
end
