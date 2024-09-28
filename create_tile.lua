function create_tile(x,y,face_color,value)
  local size = 14
  local border_color = 2
  local face_size = 10
  local tile = {
    x = x,
    y = y,
    draw = function(self)
      -- border
      rectfill(x,y,x + size - 1, y + size - 1, border_color)
      -- face
      local face_x = x + 2
      local face_y = y + 1 
      rectfill(face_x, face_y, face_x + face_size - 1, face_y + face_size - 1, face_color)
      -- value
      local tile_values = tile_values(self)
      tile_values[value]()
    end,
  }
  
  return tile
end
