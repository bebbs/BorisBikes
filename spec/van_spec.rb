require './lib/van'

describe Van do 

	let(:van){Van.new(:capacity => 30)}
	let(:station){DockingStation.new(:capacity => 123)}
	let(:bike) { Bike.new }

	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(30)
	end

	it "should check how many unavailable bikes there are at the station" do
		bike.break!
		station.dock(bike)
		expect(van.check_station(station)).to eq(1)
	end
end