class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      
      t.integer :user_id, null: false
      t.integer :musician_id, null: false
      t.integer :event_id, null: false
      t.integer :genre_item_id, null: false
      t.timestamps
    end
  end
end
