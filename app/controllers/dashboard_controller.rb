class DashboardController < ApplicationController
  def index
    @books = current_user.bookings
  end
end
