class Answer < ApplicationRecord
  belongs_to :good
  validates :content, presence: true
  validates :name, presence: true
end
