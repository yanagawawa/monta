class Lesson < ApplicationRecord


  belongs_to :trainer, optional: true


  validates :lesson_genre, presence: true
  validates :take_lesson_genre, presence: true
  validates :title, length: {maximum: 20}
  validates :lesson_word, length: {maximum: 40}
  validates :total_people,numericality: { only_integer: true }
  validates :start, presence: true
  validates :end, presence: true
  validates :total_time, presence: true
  validates :total_people, presence: true
  validates :lesson_details, presence: true
  validates :belongings, presence: true

  enum lesson_genre: { training: 0, yoga: 1, dance: 2 }

  enum take_lesson_genre: { in_person: 0, in_person_personal: 1, live: 2, online_personal: 3 }

  # validate :date_validation

  def date_validation
    if :start > :end
        errors.add(:end, "開始時間以降を指定してください。")
    end
  end

  def lesson_total_time(start_time, end_time)
  (end_time - start_time).floor / 60
  end

end
