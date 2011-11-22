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
  
  def neighbours
    world.neighbours_of(x,y)
  end
  
  def live_neighbours
    neighbours.select {|n| n.alive?}
  end
  
  def live_neighbours_count
    live_neighbours.count
  end
  
  # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
  def rule1
    die! if live_neighbours_count < 2
  end
  
  # Any live cell with two or three live neighbours lives on to the next generation.
  def rule2
  end
  
  # Any live cell with more than three live neighbours dies, as if by overcrowding.
  def rule3
    die! if live_neighbours_count > 3
  end
  
  def rule4
    rise! if live_neighbours_count == 3
  end
  
end