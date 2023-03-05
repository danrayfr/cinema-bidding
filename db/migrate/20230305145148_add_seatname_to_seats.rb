class AddSeatnameToSeats < ActiveRecord::Migration[7.0]
  def change
    add_column :seats, :seat_name, :string
  end
end
