function create_cursor(x,y)
  local color = 7
  local start_grid_x = 1
  local start_grid_y = 1
  local cursor = {
    grid_x = start_grid_x,
    grid_y = start_grid_y,
    edge_index = 0,
    edge = function(self)
      local edges = {'top','right','bottom','left'}
      local index = (self.edge_index % #edges) + 1
      return edges[index]
    end,
    draw = function(self)
      local cell = grid[self.grid_x][self.grid_y]
      local x = cell[1]
      local y = cell[2]
      if self:edge() == 'top' then
        x += 6
      elseif self:edge() == 'right' then
        x += 12
        y += 6
      elseif self:edge() == 'bottom' then
        x += 6
        y += 13
      elseif self:edge() == 'left' then
        y += 6
      end
      pset(x,y,color)
    end,
    update = function(self)
      -- left
      if btnp(0) then
        self:move(-1)
      -- right
      elseif btnp(1) then
        self:move(1)
      end
    end,
    move = function(self, value)
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
