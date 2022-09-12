class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
 
      t.integer :musician_id, null: false
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :start_month, null: false, default: 1
      t.integer :start_day, null: false, default: 1
      t.integer:start_hour, null: false, default: 0
      t.integer :start_minutes, null: false, default: 0
      t.string :place, null: false
      t.integer :price, null: false
      t.integer :capacity, null: false
      t.integer :seating_status, null: false, default: 0
      t.timestamps
    end
  end
end
