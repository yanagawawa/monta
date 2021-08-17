class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships, dependent: :destroy
  has_many :trainers, through: :relationships
  has_many :rooms, dependent: :destroy


  def follow!(other_trainer)
    relationships.create!(trainer_id: other_trainer.id)
  end

  def unfollow!(other_trainer)
    relationships.find_by(trainer_id: other_trainer.id).destroy
  end

end
