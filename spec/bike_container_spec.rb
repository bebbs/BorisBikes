require './lib/bike_container'

class ContainerHolder
	include BikeContainer
end 

describe BikeContainer do

	def fill_holder(number_of_times, holder)
		number_of_times.times { holder.dock(Bike.new) }
	end

	
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new() }

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release the bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		fill_holder(10, holder)
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder(10, holder)
		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError, 'There is no more room for bikes')
	end

	it "should not release a bike if it's empty" do
		fill_holder(0, holder)
		expect(lambda { holder.release(bike) }).to raise_error(RuntimeError, 'There are no bikes in this holder')
	end

	it "should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should provide the list of unavailable bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.unavailable_bikes).to eq([broken_bike])
	end
end