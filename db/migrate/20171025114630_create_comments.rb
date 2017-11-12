class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :message
      t.boolean :status
      t.references :post
      t.references :visitor

      t.timestamps
    end
  end
end
