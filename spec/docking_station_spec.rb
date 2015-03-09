require './lib/docking_station'

describe DockingStation do 

	let(:station){DockingStation.new(:capacity => 123)}
	let(:bike){Bike.new}
	let(:van){Van.new}

	it "should allow setting default capacity on initialising" do
		expect(station.capacity).to eq(123)
	end

	it "should accept working bikes from a van" do
		van.dock(bike)
		station.accept_from_van(van)
		expect(bike).not_to be_broken
		expect(station.bike_count).to eq(1)		
	end

end
