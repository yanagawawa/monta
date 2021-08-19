class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships, dependent: :destroy
  has_many :trainers, through: :relationships

  has_many :reserves, dependent: :destroy
  has_many :lessons, through: :reserves

  has_many :rooms, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true

  # def follow!(other_trainer)
  #   relationships.create!(trainer_id: other_trainer.id)
  # end

  # def unfollow!(other_trainer)
  #   relationships.find_by(trainer_id: other_trainer.id).destroy
  # end

end
