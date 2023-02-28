class AddUserReferenceToCinema < ActiveRecord::Migration[7.0]
  def change
    add_reference :cinemas, :user, null: false, foreign_key: true
  end
end
