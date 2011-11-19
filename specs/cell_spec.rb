require 'rspec'
require_relative "../lib/cell"

describe Cell do
  let(:world) { stub(:world) }
  let (:cell) { Cell.new(50,100, world) }
  
  it "lives in a world" do
    cell.world.should == world
  end
  
  it "is initially dead" do
    cell.should_not be_alive
  end
  
  it "has an x,y of 50,100" do
    cell.x.should == 50
    cell.y.should == 100
  end
  
  context "a cell that is brought to life" do
    before { cell.rise! }
    
    it "is alive" do
      cell.should be_alive
    end
    
    it "can be killed" do
      cell.die!
      cell.should_not be_alive
    end
  end
end