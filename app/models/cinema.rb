class Cinema < ApplicationRecord
  DEFAULT_SEAT_COUNT = 10
  belongs_to :user
  has_many :seats, dependent: :destroy
  has_many :showings, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }, :uniqueness => true
  validates :seat_count, numericality: { only_integer: true, less_than_or_equal_to: 50 }, allow_blank: true
  default_scope -> { order(created_at: :desc) }

  after_initialize :default_seats, if: :new_record?

  private

  def default_seats
    if seat_count.nil?
      self.seat_count = DEFAULT_SEAT_COUNT
    else 
      self.seat_count
    end

    return seat_count
  end

  def delete_all_and_update
    Cinema.transaction do
      self.seats.destroy_all
      update_params
    end
  end

end