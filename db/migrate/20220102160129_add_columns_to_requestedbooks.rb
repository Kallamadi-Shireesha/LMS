class AddColumnsToRequestedbooks < ActiveRecord::Migration
  def change
    add_column :requestedbooks, :user_id, :integer
    add_column :requestedbooks, :bookname, :string
    add_column :requestedbooks, :description, :text
  end
end
