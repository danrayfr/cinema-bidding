class BookingsController < ApplicationController
  before_action :authenticate_user!, only: %i(show new edit destroy)
  before_action :set_booking, only: %i()

  def index
    @showings = Showing.all.joins(:cinema)
  end

  def show
    @show = Showing.find(params[:id])
    @booking = current_user.bookings.build()
  end

  def new
    @booking = current_user.bookings.build()
  end

  def create
    @booking = current_user.bookings.build(booking_params)

    respond_to do |format|
      if Booking.exists?(seat_id: @booking.seat_id)
        format.html { redirect_to request.referer, alert: "Seat is already occupied, try and another." }
      else 
        if @booking.save
          format.html { redirect_to root_url, notice: "Bookings saved successfully."}
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit; end

  def update 
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if Booking.exists?(seat_id: @booking.seat_id)
        format.html { redirect_to request.referer, alert: "Seat is already occupied, try and another." }
      else 
        if @booking.save
          format.html { redirect_to root_url, notice: "Bookings saved successfully."}
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.destroy
        format.html { redirect_to root_url, notice: "Movie deleted successfully!"}
      end
    end

  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :showing_id, :seat_id)
  end

end
