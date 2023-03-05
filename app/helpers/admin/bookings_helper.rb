module Admin::BookingsHelper
  def booked_user(user_id)
    book = Booking.where(user_id: user_id).first
    user = User.find_by(id: book.user_id)
    "#{user.full_name}(#{user.email })"
  end
end
