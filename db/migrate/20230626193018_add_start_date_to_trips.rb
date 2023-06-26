class AddStartDateToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :start_date, :string
  end
end
