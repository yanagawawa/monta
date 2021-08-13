class Lesson < ApplicationRecord


  belongs_to :trainer, optional: true
  belongs_to :lesson_genre, optional: true
  belongs_to :take_lesson_genre, optional: true

  validates :title, length: {maximum: 20}
  validates :lesson_word, length: {maximum: 40}
  validates :total_people,numericality: { only_integer: true }
  validates :start, presence: true
  validates :end, presence: true
  validates :total_time, presence: true
  validates :total_people, presence: true
  validates :lesson_location, presence: true
  validates :lesson_details, presence: true
  validates :belongings, presence: true

  validate :date_validation

  def date_validation
    if :start > :end
        errors.add(:end, "開始時間以降を指定してください。")
    end
  end

  def lesson_total_time(start_time, end_time)
  (end_time - start_time).floor / 60
  end

end
