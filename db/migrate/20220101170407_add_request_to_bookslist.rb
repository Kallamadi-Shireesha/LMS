class AddRequestToBookslist < ActiveRecord::Migration
  def change
    add_column :bookslists, :request, :boolean
  end
end
