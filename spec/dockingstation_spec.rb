require "dockingstation.rb"

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it "releases working bikes" do
    station = DockingStation.new([Bike.new])
    my_bike = station.release_bike
    expect(my_bike).to be_working
  end
  it "should be able to dock a bike" do
    expect(subject).to respond_to(:dock).with(1).argument
  end
  it "should be able to know if there is a bike" do
    expect(subject).to respond_to(:bike)
  end
  it "should raise an error when releasing a bike from an empty docking station" do
    station = DockingStation.new([])
    expect{station.release_bike}.to raise_error("no bikes available")
  end
  it "should raise an error when the station is full and we want to dock a bike" do
    station = DockingStation.new([])
    DockingStation::DEFAULT_CAPACITY.times { station.dock(Bike.new) }
    expect{station.dock(Bike.new)}.to raise_error("station full")
  end
end
