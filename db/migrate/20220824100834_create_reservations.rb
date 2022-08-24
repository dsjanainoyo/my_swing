class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|

      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.integer :headcount, null: false
      t.integer :reserve_status, null: false, default: 0
      t.timestamps
    end
  end
end
