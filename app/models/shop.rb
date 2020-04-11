class Shop < ApplicationRecord
  belongs_to :user
  has_many :shopers, dependent: :destroy
  validates :shopname, presence: true
  validates :date, presence: true
  validates :place, presence: true
  validates :content, presence: true
end
