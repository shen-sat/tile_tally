function create_grid(x,y,size)
  local start_x = x
  local grid = {}
  for i=1, 3 do
    local row = {}
    for i=1, 3 do
      add(row, {x,y})
      x += size-1
    end
    add(grid, row)
    y += size-1
    x = start_x
  end
  
  return grid
end
