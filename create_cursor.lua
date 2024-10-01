function create_cursor(x,y)
  local color = 7
  local start_grid_x = 1
  local start_grid_y = 1
  local size = 6
  local cursor = {
    x = x,
    y = y,
    tile = create_tile(x,y,7,3),
    grid_x = start_grid_x,
    grid_y = start_grid_y,
    edge_index = 0,
    edge = function(self)
      local edges = {'top','right','bottom','left'}
      local index = (self.edge_index % #edges) + 1
      return edges[index]
    end,
    draw = function(self)
      rectfill(self.x,self.y,self.x + (size - 1), self.y + (size - 1), 7)
      self.tile:draw()
    end,
    update = function(self)
      -- anticlockwise
      if btnp(0) then
        self:update_tile_position(-1)
      -- clockwise
      elseif btnp(1) then
        self:update_tile_position(1)
      end
      self:update_x_y()
      self:update_tile()
    end,
    update_x_y = function(self)
      local cell = grid[self.grid_x][self.grid_y]
      self.x = cell[1]
      self.y = cell[2]
      if self:edge() == 'top' then
        self.x += (45 - 41)
        self.y -= (30 - 17)
      elseif self:edge() == 'right' then
        self.x += (94 - 73)
        self.y += (33-30)
      elseif self:edge() == 'bottom' then
        self.x += (77-73)
        self.y += (83-62)
      elseif self:edge() == 'left' then
        self.x -= (41-28)
        self.y += (65-62)
      end
    end,
    update_tile = function(self)
      if self:edge() == 'top' then
        self.tile.x = self.x - (45-41)
        self.tile.y = self.y - (17-3)
      elseif self:edge() == 'right' then
        self.tile.x = self.x + (100-94)
        self.tile.y = self.y - (65-62)
      elseif self:edge() == 'bottom' then
        self.tile.x = self.x - (77-73)
        self.tile.y = self.y + (89-83)
      elseif self:edge() == 'left' then
        self.tile.x = self.x - (28-14)
        self.tile.y = self.y - (33-30)
      end
    end,
    update_tile_position = function(self, value)
      local map = {
        top = { 'grid_y', value },
        right = { 'grid_x', value },
        bottom = { 'grid_y', -1 * value },
        left = { 'grid_x', -1 * value },
      }

      local grid_axis = map[self:edge()][1]
      local increment = map[self:edge()][2]

      local next_index = self[grid_axis] + increment
      if grid[self.grid_x][next_index] then 
        self[grid_axis] += increment
      else
        self.edge_index += value
      end
    end
  }
  
  return cursor
end
