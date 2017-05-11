require "dockingstation"
require "bike"

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it "releases working bikes" do
    station = DockingStation.new
    station.dock(Bike.new)
    my_bike = station.release_bike
    expect(my_bike).to be_working
  end
  it "should be able to dock a bike" do
    expect(subject).to respond_to(:dock).with(1).argument
  end
  it "should be able to know if there is a bike" do
    expect(subject).to respond_to(:bikes)
  end
  it "should raise an error when releasing a bike from an empty docking station" do
    station = DockingStation.new
    expect{station.release_bike}.to raise_error("no bikes available")
  end
  it "should raise an error when the station is full and we want to dock a bike" do
    station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { station.dock(Bike.new) }
    expect{station.dock(Bike.new)}.to raise_error("station full")
  end
  it "should allow user to set a capacity when creating a docking station" do
    expect(DockingStation.new(7).capacity).to eq 7
  end
  it "should set capacity to 20 when no arguments are passed" do
    expect(DockingStation.new.capacity).to eq 20
  end
  it "should allow bikes to be docked when they are not working" do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
  end
  it "should allow bikes to be docked when they are working" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
  end
  it "should raise an error if trying to release a bike from a docking station only containing broken bikes" do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect{(subject.release_bike)}.to raise_error("no working bikes available")
  end
  it "should only release a bike from the dock if it is working" do
    subject.dock(Bike.new)
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end
end

describe Bike do
  it "should be able to be reported broken" do
    subject.report_broken
    expect(subject).to be_broken
  end
end
