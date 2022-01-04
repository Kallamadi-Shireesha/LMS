class CreateMenuitems < ActiveRecord::Migration
  def change
    create_table :menuitems do |t|
      t.string :menu_name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
