module BikeContainer
	
	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def broken_bikes
		@broken_bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		unless bike.instance_of? Bike
			raise "This isn't a bike!"
		end
		raise "There is no more room for bikes" if full?
		bikes << bike
	end

	def release(bike)
		if empty?
			raise "There are no bikes in this holder"
		else
			bikes.delete(bike) 
		end
	end

	def release_broken(bike)
		if empty?
			raise "There are no bikes in this holder"
		else
			broken_bikes.delete(bike) 
		end
	end

	def empty?
		bike_count == 0
	end	

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject(&:broken?)
	end

	def available_broken_bikes
		broken_bikes.select(&:broken?)
	end

	def unavailable_bikes
		bikes.select(&:broken?)
	end

end