module ApplicationHelper
  
  def full_title(page_title = "")
    base_title = "Cinema Booking"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def current_user_seat(seat)
    Seat.where(id: seat).first.seat_name
  end

  def booked_movie_title(id)
    show = Showing.where(id: id).first
    movie = Movie.where(id: show.movie_id).first
    movie.title 
  end

  def booked_cinema_name(id)
    show = Showing.where(id: id).first
    cinema = Cinema.where(id: show.cinema_id).first
    cinema.name
  end

  def booked_cinema_date_time(id)
    show = Showing.where(id: id).first
    "#{show.date.strftime("%a, %d %b %Y")}: #{show.time.strftime("%I:%M %p") }"
  end

  def seat_color(color)
    "w-2 h-2 inline-block bg-#{color}-500 rounded-full mr-2"
  end

end
