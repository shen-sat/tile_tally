function tile_values(tile)
  local tile = tile
  local color = 2
  draw_one = function()
    draw_dot(tile.x + 6,tile.y + 5)
  end
  draw_two = function()
    draw_dot(tile.x + 4,tile.y + 7)
    draw_dot(tile.x + 8,tile.y + 3)
  end
  draw_three = function()
    draw_one()
    draw_two()
  end
  draw_four = function()
    draw_two()
    draw_dot(tile.x + 4,tile.y + 3)
    draw_dot(tile.x + 8,tile.y + 7)
  end
  draw_five = function()
    draw_four()
    draw_one()
  end
  draw_six = function()
    draw_dot(tile.x + 4,tile.y + 2)
    draw_dot(tile.x + 4,tile.y + 5)
    draw_dot(tile.x + 4,tile.y + 8)
    draw_dot(tile.x + 8,tile.y + 2)
    draw_dot(tile.x + 8,tile.y + 5)
    draw_dot(tile.x + 8,tile.y + 8)
  end
  draw_dot = function(x, y)
    rectfill(x, y, x + 1, y + 1, color)
  end

  return {draw_one, draw_two, draw_three, draw_four, draw_five, draw_six}
end
