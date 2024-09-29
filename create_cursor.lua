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
        local next_grid_y = self.grid_y - 1
        if grid[self.grid_x][next_grid_y] then self.grid_y -= 1 end
      -- right
      elseif btnp(1) then
        local map = {
          top = { 'grid_y', 1 },
          right = { 'grid_x', 1 },
          bottom = { 'grid_y', -1 },
          left = { 'grid_x', -1 },
        }

        self:workout(map[self:edge()][1], map[self:edge()][2])        
      end
    end,
    workout = function(self, attribute, value)
      local next_index = self[attribute] + value
      if grid[self.grid_x][next_index] then 
        self[attribute] += value
      else
        self.edge_index += 1
      end
    end
  }
  
  return cursor
end
