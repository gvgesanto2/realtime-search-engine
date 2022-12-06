class Article < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title, 
                  against: :title,
                  using: {
                    tsearch: { prefix: true, any_word: true }
                  }
  
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { minimum: 50, maximum: 5000 }
end