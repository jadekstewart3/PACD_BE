class AddEndDateToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :end_date, :string
  end
end
