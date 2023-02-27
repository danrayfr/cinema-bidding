class Admin::CinemasController < Admin::AdminController
  before_action :set_cinema, only: %i(show edit)

  def index
    @cinemas = Cinema.all
  end 

  def show; end

  def new 
    @cinema = Cinema.new
  end

  def edit; end 

  def create 
    @cinema = Cinema.new(cinema_params)

    respond_to do |format|
      if @cinema.save 
        format.html { redirect_to admin_cinemas_url, notice: "Cinema created successfully."}
      else 
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cinema = Cinema.find(params[:id])
    
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
    params.require(:cinema).permit(:name)
  end
end
