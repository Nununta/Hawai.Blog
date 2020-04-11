class Food < ApplicationRecord
  belongs_to :user
  has_many :foodanswers, dependent: :destroy
  validates :name, presence: true
  validates :food, presence: true
  validates :price, presence: true
  validates :place, presence: true
  validates :date, presence:  true
  validates :quantity, presence: true
end
