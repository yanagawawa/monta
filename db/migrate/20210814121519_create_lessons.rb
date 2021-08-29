class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|

    t.integer "trainer_id"
    t.integer "reserve_id"
    t.integer "lesson_genre", default: 0, null: false
    t.integer "take_lesson_genre", default: 0, null: false
    t.string "title", default: "", null: false
    t.string "lesson_word", default: "", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "total_time"
    t.integer "total_people", default: 1, null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.text "lesson_details", default: "", null: false
    t.text "belongings", default: "", null: false
    t.integer "lesson_status", default: 0, null: false

      t.timestamps
    end
  end
end
