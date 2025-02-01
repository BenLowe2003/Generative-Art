

class Player{
  
  int x;
  int y;
  
  boolean is_playing = true;
  
  Player(){
    x = 0;
    y = 0;
  }
  
  void display(){
    if (!is_playing){
      return;
    }
    
    pushMatrix();
    fill(0, 255, 0);
    int half_resolution = grid_resolution / 2;
    translate(x * grid_resolution + half_resolution, y * grid_resolution + half_resolution);
    circle(0, 0, grid_resolution / 4);
    popMatrix();
  }
  
  void move(String direction){
    HashMap<MazeDirection, Boolean> neighbours = maze.get_neighbours(x, y);
    
    
    switch (direction){
      case "up":
        if (neighbours.get(MazeDirection.MAZEUP)){
          y--;
          println(direction);
        }
        break;
      case "right":
        if (neighbours.get(MazeDirection.MAZERIGHT)){
          x++;
          println(direction);
        }
        break;
      case "down":
        if (neighbours.get(MazeDirection.MAZEDOWN)){
          y++;
          println(direction);
        }
        break;
      case "left":
        if (neighbours.get(MazeDirection.MAZELEFT)){
          x--;
          println(direction);
        }
        break;
    }
  }
    
}
  
  
