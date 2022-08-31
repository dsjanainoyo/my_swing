class CreateMusicianGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :musician_genres do |t|

      t.integer :genre_item_id, null: false
      t.integer :musician_id, null: false
      t.timestamps
    end
  end
end
