class World
  attr_accessor :width, :height, :cells
  
  def initialize(w, h)
    @width = w
    @height = h
    
    @cells = Array.new(@width) do |x|
      Array.new(@height) { |y| Cell.new(x,y, self) }
    end
    
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