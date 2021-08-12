class Lesson < ApplicationRecord

  belongs_to :trainer, optional: true
  belongs_to :lesson_genre, optional: true
  belongs_to :take_lesson_genre, optional: true

end
