


void draw_direction(MazeDirection direction, int x, int y){
  

  pushMatrix();
  
  // rotate to point in correct direction
  float half_grid_resolution = grid_resolution/2;
  translate(x * grid_resolution + half_grid_resolution,y * grid_resolution + half_grid_resolution);
  
  // SearchAlgorithmStuff
  if (displaying_flood){
    fill(0,255,0);
    text(search_grid.grid[x][y], 0, 0);
    fill(0);
  }
  
  // Draw nothing if cell goes nowhere
  if (direction == MazeDirection.SELF){
    circle(0, 0, half_grid_resolution);
    popMatrix();
    return;
  }

  switch (direction){
    case MAZEUP:
      break;
    case MAZERIGHT:
      rotate(PI/2);
        break;
    case MAZEDOWN:
      rotate(PI);
        break;
    case MAZELEFT:
      rotate(3 * PI/2);
      break;
    case SELF:
    translate(-x, -y);
      return;
  }
  
  // Draw and pop
  line(-half_grid_resolution, -half_grid_resolution, half_grid_resolution-2, -half_grid_resolution);

  popMatrix();
}

void draw_grid(){
  for (int x = 0; x < width; x += grid_resolution) {
    // Draw vertical lines
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += grid_resolution) {
    // Draw vertical lines
    line(0, y, width, y);
  }
  
  line(width, height-1, 0, height-1);
  line(width-1, height, width-1, 0);
}
