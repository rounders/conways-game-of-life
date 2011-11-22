require 'rspec'
require_relative "../lib/cell"

describe Cell do
  let(:world) { stub(:world) }
  let (:cell) { Cell.new(50,100, world) }
  
  context "a new cell at 50,100" do
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

    it "has neighbours" do
      results = stub
      world.should_receive(:neighbours_of).with(50,100).and_return(results)
      cell.neighbours
    end

    it "has live neighbours" do
      n1 = Cell.new(51,100, world)
      n1.rise!
      n2 = Cell.new(49,100, world)
      results = [n1,n2]
      cell.should_receive(:neighbours).and_return(results)
      cell.live_neighbours.should == [n1]
    end
  end
  
  context "a cell that that rises from the dead" do
    before { cell.rise! }
    
    it "is alive" do
      cell.should be_alive
    end
    
    it "can die" do
      cell.die!
      cell.should_not be_alive
    end
  end
  
  describe "#rule1" do
    before { cell.rise! }

    it "Any live cell with less then 2 live neighbour dies, as if caused by under-population." do
      [0,1].each do |neighbours_count| 
        cell.rise!
        cell.stub(:live_neighbours_count).and_return(neighbours_count)
        cell.rule1
        cell.should_not be_alive
      end
    end
  end
  
  context "#rule3" do
    it "Any live cell with 4 or more live neighbours dies, as if by overcrowding." do
      [4,5,6,7,8].each do |neighbours_count|    
        cell.rise!
        cell.stub(:live_neighbours_count).and_return(neighbours_count)
        cell.rule3
        cell.should_not be_alive
      end
    end
  end

  context "#rule4" do
    it "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
      cell.stub(:live_neighbours_count).and_return(3)
      cell.rule4
      cell.should be_alive
    end

    it "Any dead cell with less than 3 live neighbours stays dead" do
      [0,1,2].each do |neighbours_count|
        cell.die!
        cell.stub(:live_neighbours_count).and_return(neighbours_count)
        cell.rule4
        cell.should_not be_alive
      end
    end
  end
end

#         x
#  xxx   x x
#  xxx   x x
#         x
# 