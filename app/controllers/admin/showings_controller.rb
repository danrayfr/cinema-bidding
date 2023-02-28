class Admin::ShowingsController < ApplicationController
  before_action :set_showing, only: [:show, :edit]
  def index
    @showings = Showing.all
  end

  def new
    @showing = Showing.new 
  end

  def edit; end

  def create
    
    @showing = Showing.new(showing_params)

    respond_to do |format|
      time = @showing.time
      if time.present?
        formatted_time = time.strftime("%H:%M")
        if formatted_time == "10:00" || formatted_time == "14:00" || formatted_time == "18:00" || formatted_time == "22:00"
          
          if @showing.save        
            format.html { redirect_to admin_showings_url, notice: "Show created successfully."}
          else 
            format.html { render :new, status: :unprocessable_entity }
          end

        else
          format.html { redirect_to request.referer, alert: 'These are the only available time: 10AM, 2PM, 6PM, 10PM' }
        end  
      else 
        format.html { redirect_to request.referer, alert: "Time shouldn't be emtpy! " }
      end
    end
  end

  def update
    @showing.update(showing_params)

    respond_to do |format|
      time = @showing.time
      date = @showing.date 
      if time.present?
        formatted_time = time.strftime("%H:%M")
        if formatted_time == "10:00" || formatted_time == "14:00" || formatted_time == "18:00" || formatted_time == "22:00"
          
          if @showing.update        
            format.html { redirect_to admin_showings_url, notice: "Show updated successfully."}
          else 
            format.html { render :new, status: :unprocessable_entity }
          end

        else
          format.html { redirect_to request.referer, alert: 'These are the only available time: 10AM, 2PM, 6PM, 10PM' }
        end  
      else 
        format.html { redirect_to request.referer, alert: "Time shouldn't be emtpy! " }
      end
    end
  end

  def destroy
    @showing = Showing.find(params[:id])

    respond_to do |format| 
      if @showing.destroy
        format.html { redirect_to admin_showings_url, notice: "showing record deleted successfully!"}
      end
    end
  end

  private

  def set_showing
    @showing = Showing.find(params[:id])
  end

  def showing_params
    params.require(:showing).permit(:date, :time, :movie_id, :cinema_id)
  end

end
