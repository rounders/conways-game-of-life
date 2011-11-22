class World
  attr_accessor :width, :height, :next_cells
  
  def initialize(w, h)
    @width = w
    @height = h
    
    @cells = Array.new(@width) do |x|
      Array.new(@height) { |y| Cell.new(x,y, self) }
    end

  end
  
  def empty_world
    Array.new(@width) do |x|
      Array.new(@height) { |y| nil }
    end
  end
  
  def tick
    next_world = empty_world
    
    @cells.each do |col|
      col.each do |cell|
        shadow_cell = cell.dup

        shadow_cell.rule1
        shadow_cell.rule2
        shadow_cell.rule3
        shadow_cell.rule4

        next_world[shadow_cell.x][shadow_cell.y] = shadow_cell
      end
    end
    
    @cells = next_world
  end
  
  def neighbours_of(x,y)
    neighbours = []
    (-1..1).each do |dx|
      (-1..1).each do |dy|
        next if dx == 0 && dy == 0
        neighbours << cell_at(x+dx, y+dy) 
      end
    end
    neighbours.compact
  end
  
  def cell_at(x,y)
    @cells[x][y] unless out_of_bounds?(x,y)
  end

  def out_of_bounds?(x,y)
    x < 0 || x > (width-1) || y < 0 || y > (height-1)
  end
  
end