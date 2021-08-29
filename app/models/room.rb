class Room < ApplicationRecord

  belongs_to :trainer
  belongs_to :user
  has_many :messages, dependent: :destroy

end
