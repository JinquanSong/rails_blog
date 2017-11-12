class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :notifiable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
