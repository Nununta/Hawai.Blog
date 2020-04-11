class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable,  :lockable, :timeoutable
  # ,:confirmable,

  has_one :profile, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :uploads, dependent: :destroy
end
