require './lib/van'

describe Van do 

	let(:van){ Van.new(:capacity => 30) }
	let(:station){ DockingStation.new(:capacity => 123) }
	let(:bike){ Bike.new }
	let(:bike2){ Bike.new }
	let(:garage){ Garage.new(:capacity => 1000) }

	def fill_van(van)
		30.times { van.dock(Bike.new) }
	end

	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(30)
	end

	it "should check how many unavailable bikes there are at the station" do
		bike.break!
		station.dock(bike)
		expect(van.number_of_broken_bikes_at(station)).to eq(1)
	end

	it "should collect broken bikes from station" do
		bike.break!
		station.dock(bike)
		van.collect_from_station(station)
		expect(van.number_of_broken_bikes_at(station)).to eq(0)
	end

	it "should collect fixed bikes from garage" do
		garage.dock(bike)
		garage.dock(bike2)
		van.collect_from_garage(garage)
		expect(garage.available_bikes.length).to eq(0)
		expect(van.bike_count).to eq(2)
	end

end