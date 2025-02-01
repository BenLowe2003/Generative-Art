import java.util.ArrayList;
import java.util.Random;

int grid_width = 100;
int grid_height = 100;
int cell_resolution = 20;
Grid grid;

Random random = new Random();
double random_probability = 0.45;


void setup() {
  fullScreen();
  grid_width = displayWidth / cell_resolution;
  grid_height = displayHeight / cell_resolution;
  grid = new Grid(grid_width, grid_height, cell_resolution);
}

void draw() {
  background(255); // Optional: Clear the background each frame
  grid.display();
  
  if (mousePressed){
    if (mouseButton == LEFT){
      grid.set_cell((int) mouseX / cell_resolution, (int)mouseY / cell_resolution, true);
    }
    else if (mouseButton == RIGHT){
      grid.set_cell((int) mouseX / cell_resolution, (int)mouseY / cell_resolution,false);
    }
  }
}

void keyPressed(){
  if (key == ENTER){
    println("working");
    grid = grid.update();
  }
  else if (key == DELETE){
    grid.reset();
  }
  else if (key == ' '){
    grid = new Grid(grid_width, grid_height, cell_resolution);
  }
}
