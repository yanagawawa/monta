class Room < ApplicationRecord

  belongs_to :trainer, optional: true
  belongs_to :user, optional: true

end
