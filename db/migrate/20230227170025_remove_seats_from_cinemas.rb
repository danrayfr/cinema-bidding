class RemoveSeatsFromCinemas < ActiveRecord::Migration[7.0]
  def change
    remove_column :cinemas, :seats, :integer
  end
end
