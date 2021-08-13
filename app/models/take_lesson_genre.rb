class TakeLessonGenre < ApplicationRecord

  has_many :lessons, dependent: :destroy

   enum genre: { in_person: 0, in_person_personal: 1, live: 2, online_personal: 3 }

end
