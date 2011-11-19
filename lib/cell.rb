class Cell
  attr_accessor :x, :y, :alive, :world
  
  def initialize(x, y, world)
    @x = x
    @y = y
    @alive = false
    @world = world
  end
  
  def alive?
    @alive
  end
  
  def die!
    @alive = false
  end
  
  def rise!
    @alive = true
  end
  
end