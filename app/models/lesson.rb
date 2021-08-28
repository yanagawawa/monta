class Lesson < ApplicationRecord

  belongs_to :trainer, optional: true

  has_many :reserves, dependent: :destroy
  has_many :users, through: :reserves

  scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない
     title_like(search_params[:title])
      .genre_is(search_params[:lesson_genre])
      .start_time(search_params[:start_time])
      .start_time_end(search_params[:start_time_end])
      .prefecture_id_is(search_params[:prefectures])
  end

  scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }
  scope :genre_is, -> (lesson_genre) { where(lesson_genre: lesson_genre) if lesson_genre.present? }
  scope :start_time, -> (from) { where('? <= start_time', from) if from.present? }
  scope :start_time_end, -> (to) { where('start_time < ?', to) if to.present? }
  scope :prefecture_id_is, -> (prefectures) { joins(:trainer).where(trainers: { prefectures: prefectures }) if prefectures != "---" }

  geocoded_by :address
  after_validation :geocode

  validates :lesson_genre, presence: true
  validates :take_lesson_genre, presence: true
  validates :title, length: {maximum: 20}
  validates :lesson_word, length: {maximum: 40}
  validates :total_people,numericality: { only_integer: true }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :total_time, presence: true
  validates :total_people, presence: true
  validates :lesson_details, presence: true
  validates :belongings, presence: true

  enum lesson_genre: { training: 0, yoga: 1, dance: 2 }

  enum take_lesson_genre: { in_person: 0, in_person_personal: 1, live: 2, online_personal: 3 }

  enum lesson_status: { not_held: 0, held: 1, cancel: 2 }

  validate :date_validation
  validate :start_check, if: :is_not_held_status?

  def is_not_held_status?
    lesson_status == "not_held"
  end

  def date_validation
    if self.start_time >= self.end_time
        errors.add(:end_time, "開始時間以降を指定してください。")
    end
  end

  def start_check
    if self.start_time < Time.now
    errors.add(:start_time, "現在の日時より遅い時間を選択してください")
    end
  end

  def lesson_total_time(start_time, end_time)
    (end_time - start_time).floor / 60
  end

end
