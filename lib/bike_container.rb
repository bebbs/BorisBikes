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
		raise "This isn't a bike!" if !is_a_bike?(bike)
		raise "There is no more room for bikes" if full?
		bikes << bike
	end

	def release(bike)
		empty? ? (raise "There are no bikes in this holder") : bikes.delete(bike)
	end

	def release_broken(bike)
		if empty?
			raise "There are no bikes in this holder"
		else
			broken_bikes.delete(bike) 
		end
	end

  def is_a_bike?(bike)
    bike.instance_of? Bike
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