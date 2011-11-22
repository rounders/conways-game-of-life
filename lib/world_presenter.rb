require 'colorize'

class WorldPresenter
  attr_accessor :world
  
  def initialize(world)
    @world = world
  end
  
  def draw
    clear_terminal
    0.upto(world.height - 1) do |y|
      0.upto(world.width - 1) do |x|
        cell = world.cell_at(x,y)
        print cell.alive? ? '*'.colorize(:green) : '-'
      end
      print "\n"
    end
  end
  
  def clear_terminal
    puts "\e[H\e[2J"
  end
end