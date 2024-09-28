function create_grid(x,y,size)
  local start_x = x
  local grid = {}
  for i=1, 3 do
    local row = {}
    for i=1, 3 do
      add(row, {x,y})
      x += size
    end
    add(grid, row)
    y += size
    x = start_x
  end
  
  return grid
end
