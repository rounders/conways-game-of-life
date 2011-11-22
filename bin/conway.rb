#!/usr/bin/env ruby 

require_relative '../lib/conway'

world = World.new(80, 40)
world_presenter = WorldPresenter.new(world)

initial_conditions = [ [1,5], [1,6], [2,5], [2,6],

                      [11, 5], [11, 6], [11, 7],
                      [12, 4], [12, 8], 
                      [13, 3], [13, 9],
                      [14, 3], [14, 9],
                      [15, 6], 
                      [16, 4], [16, 8],
                      [17, 5], [17, 6], [17, 7],
                      [18, 6],
                      
                     [21, 3], [21, 4], [21, 5],
                     [22, 3], [22, 4], [22, 5],
                     [23, 2], [23, 6],
                     [25, 1], [25, 2], [25, 6], [25, 7],
                     
                     [35, 3], [35, 4],
                     [36, 3], [36, 4]
                  ]

# initial_conditions = [
#   [5,5],[6,5],[7,5],
#   [5,6],[6,6],[7,6]
#   ]
# 
# cell some initial conditions
initial_conditions.each do |x,y|
  world.cell_at(x,y).rise!
end

while (1) do
  world_presenter.draw
  sleep(0.01)
  world.tick
end
  