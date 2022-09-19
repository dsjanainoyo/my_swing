class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.text :comment, null: false
      t.integer :musician_id
      t.integer :user_id
      t.integer :event_id, null: false
      t.timestamps
    end
  end
end
