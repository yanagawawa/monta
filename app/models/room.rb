class Room < ApplicationRecord

  belongs_to :trainer, optional: true

end
