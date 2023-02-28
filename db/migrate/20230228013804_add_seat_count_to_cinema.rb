class AddSeatCountToCinema < ActiveRecord::Migration[7.0]
  def change
    add_column :cinemas, :seat_count, :integer
  end
end
