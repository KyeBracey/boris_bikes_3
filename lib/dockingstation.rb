require_relative "bike"

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "no bikes available" if empty?
    working_bikes = @bikes.select{|bike| bike.working?}
    raise "no working bikes available" if working_bikes == []
    @bikes.delete(working_bikes.pop)
  end

  def dock(bike)
    raise "station full" if full?
    @bikes << bike
  end

  private
  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.length == DEFAULT_CAPACITY
  end
end
