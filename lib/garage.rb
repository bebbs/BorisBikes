require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def accept(van)
		van.broken_bikes.each do |bike| 
			bike.fix!  
			dock(bike)
		end
		van.broken_bikes.clear
	end

end