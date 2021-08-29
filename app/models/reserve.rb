class Reserve < ApplicationRecord

  belongs_to :user
  belongs_to :lesson

  enum take_lesson_status: { not_held: 0, held: 1, cancel: 2 }

end
