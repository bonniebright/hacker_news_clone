class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :post
      t.text :link
      t.integer :votes

      t.timestamps
    end
  end
end
