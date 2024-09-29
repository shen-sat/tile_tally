function create_cursor(x,y)
  local color = 7
  local start_grid_x = 1
  local start_grid_y = 1
  local start_edge = 'top'
  local cursor = {
    grid_x = start_grid_x,
    grid_y = start_grid_y,
    edge = start_edge,
    draw = function(self)
      local cell = grid[self.grid_x][self.grid_y]
      local x = cell[1]
      local y = cell[2]
      if self.edge == 'top' then
        x += 6
      elseif self.edge == 'right' then
        x += 12
        y += 6
      elseif self.edge == 'bottom' then
        x += 6
        y += 13
      elseif self.edge == 'left' then
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
        if self.edge == 'top' then
          local next_grid_y = self.grid_y + 1
          if grid[self.grid_x][next_grid_y] then 
            self.grid_y += 1
          else
            self.edge = 'right'
          end
        elseif self.edge == 'right' then
          local next_grid_x = self.grid_x + 1
          if grid[self.grid_x][next_grid_x] then 
            self.grid_x += 1
          else
            self.edge = 'bottom'
          end
        elseif self.edge == 'bottom' then
          local next_grid_y = self.grid_y - 1
          if grid[self.grid_x][next_grid_y] then 
            self.grid_y -= 1
          else
            self.edge = 'left'
          end
        elseif self.edge == 'left' then
          local next_grid_x = self.grid_x - 1
          if grid[self.grid_x][next_grid_x] then 
            self.grid_x -= 1
          else
            self.edge = 'top'
          end
        end
        
      end
    end
  }
  
  return cursor
end
