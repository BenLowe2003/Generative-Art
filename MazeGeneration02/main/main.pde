import java.util.ArrayList;
import java.util.HashMap;

public enum MazeDirection {
  MAZEUP, MAZEDOWN, MAZELEFT, MAZERIGHT, SELF
}

int grid_resolution = 20;
int grid_width;
int grid_height;
int minotaur_speed = 10;

Maze maze;
SearchGrid search_grid;
Player player;

void setup(){
  fullScreen();
  
  grid_width = width / grid_resolution;
  grid_height = height / grid_resolution;
  
  player = new Player();
  maze = new Maze();
  search_grid = new SearchGrid();
  
  
  
  maze.mutate(grid_width  * grid_height * grid_height);
}


boolean is_battling = false;
boolean is_routefinding = false;
boolean displaying_flood = false;

void draw(){
  // Draw Grid
  background(0);
  stroke(255);
  draw_grid();

  
  // Draw Maze
  maze.display();

  
  if (is_battling){
    maze.mutate(minotaur_speed);

  }
  
  if (is_routefinding){
    search_grid.grid_reset();
    search_grid.complete_flood();
    search_grid.display_path();
  }
  
  player.display();
  
}

void keyPressed(){
  if (key == ' '){
    maze.mutate(minotaur_speed);
  }
  
  if (key == ENTER){
    is_routefinding = !is_routefinding;
  }
  
  
  if (key == 's'){
    is_battling = !is_battling;
  }
  
  if (key == 'd'){
      displaying_flood = !displaying_flood;
    }
  
  if (key == 'r'){
    player.x = 0;
    player.y = 0;
    maze.mutate(grid_width  * grid_height * grid_height);
  }
  
  if (key == CODED){
    
    if (keyCode == UP){
      player.move("up");
    }
    if (keyCode == RIGHT){
      player.move("right");
    }
    if (keyCode == DOWN){
      player.move("down");
    }
    if (keyCode == LEFT){
      player.move("left");
    }
  }
}
  
