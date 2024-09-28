pico-8 cartridge // http://www.pico-8.com
version 32

__lua__
function _init()
  counter = 0
  #include create_grid.lua
  grid = create_grid(41,30,16)
end

function _update()
  counter = counter + 1
end 

function _draw()
  cls()
  -- bg

  rectfill(0,0,127,127,13)
  -- draw grid
  local col = 1
  for row in all(grid) do
    for cell in all(row) do
      local x, y = cell[1], cell[2]
      rectfill(x, y, x + 15, y + 15, col)
      col += 1
    end
  end
  -- check grid
  pset(41,30,11)
  pset(86,30,11)
  pset(41,77,11)
  pset(86,77,11)
  print(counter, 7, 7)
end