require 'rspec'
require_relative "../lib/world"
require_relative "../lib/cell"

describe World do
  let(:world) { World.new(100,200) }
  
  it "has a width and height" do
    world.width.should == 100
    world.height.should == 200
  end
  
  it "returns a cell at a given location" do
    cell = world.cell_at(10,50)
    cell.should be_kind_of(Cell)
    cell.x.should == 10
    cell.y.should == 50
  end
  
  describe '#neighbors_of(x,y)' do
    it "provides a list of 8 neighbors to the cell at 10,10" do
      neighbours = world.neighbours_of(10,10)
      neighbours.count.should == 8
      [[9,11], [10,11], [11,11], [11,10], [11,9], [10,9], [9,9], [9, 10]].each do |coordinates|
        cell = world.cell_at(coordinates[0], coordinates[1])
        neighbours.should include(cell)
      end
    end
    
    it "provides a list of 3 neighbours for the cell at 0,0" do
      world.neighbours_of(0,0).count.should == 3
    end
  end
  
  
  
  it 'does not return a cell if out of bounds' do
    world.cell_at(200,300).should be_nil
  end
end