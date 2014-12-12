require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def change_to_broken_bike_array(station)
		station.unavailable_bikes.each do |bike| 
      broken_bikes << bike 
    end
	end

	def number_of_broken_bikes_at(station)
		station.unavailable_bikes.length
	end

	def collect_from_station(station)
		change_to_broken_bike_array(station)
		broken_bikes.push do |bike| 
      dock(bike) 
    end

		station.unavailable_bikes.each do |bike| 
      station.release(bike)
    end
	end

	def collect_from_garage(garage)
		garage.available_bikes.each do |bike| 
      dock(bike) 
    end

		garage.available_bikes.each do |bike| 
      garage.release(bike)
    end
	end

end


