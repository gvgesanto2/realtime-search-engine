class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
end