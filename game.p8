pico-8 cartridge // http://www.pico-8.com
version 32

__lua__
function _init()
  counter = 0
  #include create_grid.lua
  #include create_tile.lua
  #include tile_values.lua
  #include create_cursor.lua
  #include create_stack.lua

  grid = create_grid(41,30,16)
  tiles = {}
  tile_colors = {14,12,11,9,8}
  cursor = create_cursor(1,1)
  stack = create_stack()

  for row in all(grid) do
    for cell in all(row) do
      local x, y = cell[1], cell[2]
      local color_index = (flr(rnd(#tile_colors)) + 1)
      local value = (flr(rnd(6)) + 1)
      local tile = create_tile(x,y,tile_colors[color_index],value)
      add(tiles, tile)
    end
  end
end

function _update()
  counter = counter + 1
  cursor:update()
  stack:update()
end 

function _draw()
  cls()
  -- bg

  rectfill(0,0,127,127,13)

  for tile in all(tiles) do
    tile:draw()
  end

  -- check grid
  -- pset(41,30,11)
  -- pset(86,30,11)
  -- pset(41,77,11)
  -- pset(86,77,11)

  --cursor
  cursor:draw()

  stack:draw()

  print(counter, 7, 7)
end