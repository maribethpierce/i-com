require_relative 'distance.rb'
class Customer
  attr_reader :lat, :lng, :user_id, :name


  def initialize(latitude, user_id, name, longitude)
    @lat = latitude
    @user_id = user_id
    @name = name
    @lng = longitude
  end

  def distance
    office_lat = 53.3381985 * 0.0175
    office_lng = -6.2592576 * 0.0175
    customer_lat = @lat.to_f * 0.0175
    customer_lng = @lng.to_f * 0.0175
    earth_radius = 6372.797560856 #kilometers
    delta_cannon = Math.acos(Math.sin(office_lat) * Math.sin(customer_lat) + Math.cos(office_lat) * Math.cos(customer_lat) * Math.cos(office_lng - customer_lng).abs)
    @distance = earth_radius * delta_cannon
    @distance.round(2)
  end

end
