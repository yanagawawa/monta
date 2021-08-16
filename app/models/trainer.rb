class Trainer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :lessons, dependent: :destroy
         has_many :rooms, dependent: :destroy

          validates :last_name, presence: true
          validates :first_name, presence: true
          validates :last_name_kana, presence: true
          validates :first_name_kana, presence: true

          attachment :profile_image
          attachment :pr_image
end
