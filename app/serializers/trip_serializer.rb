class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_date, :end_date
end