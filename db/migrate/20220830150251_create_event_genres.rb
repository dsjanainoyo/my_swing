class CreateEventGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :event_genres do |t|
    
      t.integer :event_id, null: false
      t.integer :genre_item_id, null: false
      t.timestamps
    end
  end
end
