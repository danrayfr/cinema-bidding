class Seat < ApplicationRecord
  belongs_to :cinema
  has_many :bookings, dependent: :destroy
end
