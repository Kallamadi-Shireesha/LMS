class CreateRequestedbooks < ActiveRecord::Migration
  def change
    create_table :requestedbooks do |t|
      t.integer :bookslist_id
      
      t.timestamps null: false
    end
  end
end
