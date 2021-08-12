class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|

      t.integer :trainer_id
      t.integer :user_id
      t.integer :lesson_genre_id
      t.integer :take_lesson_genre_id
      t.string :title, default: "", null: false
      t.string :lesson_word , default: "", null: false
      t.datetime :start
      t.datetime :end
      t.integer :total_time
      t.integer :total_people, default: 1, null: false
      t.string :lesson_location
      t.text :lesson_details, default: "", null: false
      t.text :belongings, default: "", null: false
      t.integer :lesson_status, default: 0, null: false

      t.timestamps
    end
  end
end
