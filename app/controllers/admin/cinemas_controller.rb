class Admin::CinemasController < Admin::AdminController
  before_action :set_cinema, only: %i(show edit)
  before_action :set_default_seat_count

  def index
    @cinemas = Cinema.all
  end 

  def show; end

  def new 
    @cinema = current_user.cinemas.build
  end

  def edit; end 

  def create 
    @cinema = current_user.cinemas.build(cinema_params)

    if @cinema.seat_count.nil? || @cinema.seat_count <= 10
      @cinema.seat_count = 10
    end

    respond_to do |format|
      if @cinema.save

        if @cinema.seat_count.nil? || @cinema.seat_count <= 10
          @cinema.seat_count = 10
          Cinema::DEFAULT_SEAT_COUNT.times do |n|

            @cinema.seats.create(seat_name: "Seat: #{n+1}")
          end
        # else
        #   @cinema.seat_count.times do 
        #     @cinema.seats.create(seat_name: "")
        #   end
        end
      
        format.html { redirect_to admin_cinemas_url, notice: "Cinema created successfully."}
      else 
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cinema = Cinema.find(params[:id])
    @cinema.user_id = current_user.id
    
    respond_to do |format|
      if @cinema.update(cinema_params)
        format.html { redirect_to admin_cinema_url(@cinema), notice: "Cinema updated successfully." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy 
    @cinema = Cinema.find(params[:id])

    respond_to do |format| 
      if @cinema.destroy
        format.html { redirect_to admin_cinemas_url, notice: "Cinema deleted successfully!"}
      end
    end
  end

  private

  def set_cinema
    @cinema = Cinema.find(params[:id])
  end

  def cinema_params
    params.require(:cinema).permit(:name, :seat_count)
  end

  def set_default_seat_count
    @default_seat_count = Cinema::DEFAULT_SEAT_COUNT
  end

end
