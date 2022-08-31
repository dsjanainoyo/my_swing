class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :musician_id, null: false
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.timestamps
    end
  end
end