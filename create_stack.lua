function create_stack()
  local stack = {
    tiles = {
      create_tile(x,y,7,3),
      create_tile(x,y,7,3),
      create_tile(x,y,7,3),
      create_tile(x,y,7,3),
      create_tile(x,y,7,3),
    },
    tile_x_y_points = {
      {107,87},
      {107,98},
      {107,106},
      {107,110},
      {107,114}
    },
    update = function(self)
      self:update_tiles()
    end,
    update_tiles = function(self)
      for i=1, #self.tiles do
        local tile = self.tiles[i]
        local point = self.tile_x_y_points[i]
        tile.x = point[1]
        tile.y = point[2]
      end
    end,
    draw = function(self)
      local tiles_backwards = {}
      for i=#self.tiles, 1, -1 do
        local tile = self.tiles[i]
        tile:draw()
      end
    end
  }
  
  return stack
end
