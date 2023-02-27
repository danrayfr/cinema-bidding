class RemoveUserFromCinema < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cinemas, :user, null: false, foreign_key: true
  end
end
