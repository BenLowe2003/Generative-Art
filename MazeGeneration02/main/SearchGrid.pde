

class SearchGrid{
  
  int[][] grid;
  
  SearchGrid(){
    grid_reset();
   
  }
  
  
  
  void flood(){

    for (int x = 0; x < grid_width; x++){
      for (int y = 0; y < grid_height; y++){
        if (grid[x][y] >= 1000){
          
          int leastvalue = 1000;
          HashMap<MazeDirection, Boolean> neighbours = maze.get_neighbours(x,y);
          
  
          if (neighbours.get(MazeDirection.MAZEUP) && grid[x][y-1] < leastvalue)     { leastvalue = grid[x][y-1]; }
          if (neighbours.get(MazeDirection.MAZERIGHT) && grid[x+1][y] < leastvalue)  { leastvalue = grid[x+1][y]; }
          if (neighbours.get(MazeDirection.MAZEDOWN) && grid[x][y+1] < leastvalue)   { leastvalue = grid[x][y+1]; }
          if (neighbours.get(MazeDirection.MAZELEFT) && grid[x-1][y] < leastvalue)   { leastvalue = grid[x-1][y]; }
          
          grid[x][y] = leastvalue+1;
        }
      }
    }
  }
  
  void complete_flood(){
    boolean path_found = false;
    while (!path_found){
      
      flood();
      
      if (grid[grid_width - 1][grid_height - 1] < 1000){
        path_found = true;
      }
    }
  }
  
  void display_path(){
    boolean start_found = false;
    int x = grid_width - 1;
    int y = grid_height - 1;
    
    fill(255, 0, 0, 50);
    noStroke();
    
    println("start while");
    while (!start_found){
      rect(x * grid_resolution, y * grid_resolution, grid_resolution, grid_resolution);
      
      HashMap<MazeDirection, Boolean> neighbours = maze.get_neighbours(x, y);
      int new_x = x;
      int new_y = y;
      
      if (neighbours.get(MazeDirection.MAZEUP))     { if (grid[x][y - 1] < grid[x][y]) { new_y--;}}
      if (neighbours.get(MazeDirection.MAZERIGHT))  { if (grid[x + 1][y] < grid[x][y]) { new_x++;}}
      if (neighbours.get(MazeDirection.MAZEDOWN))   { if (grid[x][y + 1] < grid[x][y]) { new_y++;}}
      if (neighbours.get(MazeDirection.MAZELEFT))   { if (grid[x - 1][y] < grid[x][y]) { new_x--;}}
      
      x = new_x;
      y = new_y;
      
      
      if (x == player.x && y == player.y){
        rect(x * grid_resolution, y * grid_resolution, grid_resolution, grid_resolution);
        start_found = true;
      }
    }
    
    println("End while");
    return;
  }
      
  void grid_reset(){
    grid =  new int[grid_width][grid_height];
   for (int x = 0; x < grid_width; x++){
    for (int y = 0; y < grid_height; y++){
      grid[x][y] = 1000;
    }
   }
   
   grid[player.x][player.y] = 0;
  }
    
}
