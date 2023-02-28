class Movie < ApplicationRecord
  belongs_to :user
  validates :title, presence: :true , length: { maximum: 30 }, :uniqueness => true
  default_scope -> { order(created_at: :desc) }
end