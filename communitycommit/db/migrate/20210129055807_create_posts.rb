class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :admin_id
      t.integer :community_id
      t.string :title
      t.text :post_text
      t.boolean :in_front, default: true
      t.string :image_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
