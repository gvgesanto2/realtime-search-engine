class Article < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  pg_search_scope :search_by_title,
                  against: [
                    [:title, 'A'],
                    [:body, 'C']
                  ],
                  associated_against: {
                    user: { name: 'B' }
                  },
                  using: {
                    tsearch: { prefix: true, any_word: true },
                    trigram: {
                      only: [:title],
                      threshold: 0.25
                    }
                  }

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { minimum: 50, maximum: 5000 }
end
