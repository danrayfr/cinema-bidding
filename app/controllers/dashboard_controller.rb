class DashboardController < ApplicationController
  def index
    @books = current_user.bookings
  end

  def destroy
    @book = Booking.find(params[:id])

    respond_to do |format|
      if @book.destroy
        format.html { redirect_to dashboard_url, notice: 'Book was successfully destroyed'}
      end
    end
  end
end
