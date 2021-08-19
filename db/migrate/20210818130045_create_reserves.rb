class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|

      t.integer :user_id
      t.integer :lesson_id
      t.integer :take_lesson_status, default: 0, null: false

      t.timestamps
    end
  end
end
