class TakeLessonGenre < ApplicationRecord

  has_many :lessons, dependent: :destroy

   enum genre: { in_person: 0, live: 1, online_personal: 2, in_person_personal: 3 }

end
