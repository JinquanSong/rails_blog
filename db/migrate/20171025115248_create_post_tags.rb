class CreatePostTags < ActiveRecord::Migration[5.1]
  def change
    create_table :post_tags do |t|
      t.references :post
      t.references :tag

      t.timestamps
    end
  end
end
