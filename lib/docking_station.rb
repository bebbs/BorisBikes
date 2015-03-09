require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def accept_from_van(van)
		van.available_bikes.each {|bike| dock(bike)}
		van.bikes.clear
	end

end

