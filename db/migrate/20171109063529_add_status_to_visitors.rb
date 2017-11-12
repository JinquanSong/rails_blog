class AddStatusToVisitors < ActiveRecord::Migration[5.1]
  def change
    add_column :visitors, :status, :boolean, default: false
  end
end
