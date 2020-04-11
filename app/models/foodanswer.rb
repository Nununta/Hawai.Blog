class Foodanswer < ApplicationRecord
  belongs_to :food
  validates :name, presence: true
  validates :content, presence: true
end
