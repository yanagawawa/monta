class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.integer :room_id
      t.integer :user_id
      t.integer :trainer_id
      t.string :message, default: "", null: false
      t.boolean :sender, null: false

      t.timestamps
    end
  end
end
