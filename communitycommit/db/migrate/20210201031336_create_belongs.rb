class CreateBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :belongs do |t|
      t.integer :user_id
      t.integer :community_id

      t.timestamps
    end
  end
end
