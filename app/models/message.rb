class Message < ApplicationRecord

  belongs_to :trainer, optional: true
  belongs_to :user, optional: true
  belongs_to :room

  enum sender: { user: false, trainer: true }

end
