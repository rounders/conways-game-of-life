require 'rspec'
require_relative "../lib/conway"
describe World do
  let(:world) { World.new(15,20) }
  
  it "has a width and height" do
    world.width.should == 15
    world.height.should == 20
  end
  
  describe "#cell_at(x,y)" do
    it "returns a cell at a given location" do
      cell = world.cell_at(1,5)
      cell.should be_kind_of(Cell)
      cell.x.should == 1
      cell.y.should == 5
    end
  end
  
  describe '#neighbors_of(x,y)' do
    it "provides a list of 8 neighbors to the cell at 10,10" do
      neighbours = world.neighbours_of(10,10)
      neighbours.count.should == 8
      [[9,11], [10,11], [11,11], [11,10], [11,9], [10,9], [9,9], [9, 10]].each do |x,y|
        cell = world.cell_at(x, y)
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
  
  describe "#live_cells" do
    it "returns a list of live cells" do
      cell1 = world.cell_at(10,10)
      cell1.rise!
      
      cell2 = world.cell_at(5,5)
      cell2.rise!
      
      cell3 = world.cell_at(6,6)
    
      world.live_cells.count.should == 2
      world.live_cells.should include(cell1)
      world.live_cells.should include(cell2)
      world.live_cells.should_not include(cell3)
    end
  end
  
  describe "#tick" do
    pending "should call all the conway rules" do
    end
  end
end