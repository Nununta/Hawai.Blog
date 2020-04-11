class Good < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :name, presence: true
  validates :quantity, presence: true
end
