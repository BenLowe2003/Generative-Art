

class Grid{
  
  ArrayList<Cell> cell_array;
  int cell_resolution;
  
  Grid(int grid_width, int grid_height, int temp_cell_resolution){
    
    cell_resolution = temp_cell_resolution;
    
    cell_array = new ArrayList<Cell>[grid_width][grid_height];
    
    for (int x = 0; x < grid_width; x++){
      for (int y = 0; y < grid_height; y++){
        cell_array[x][y] = Cell(false);
      }
    }
  }
  
  void set_cell(int x, int y, boolean value){
    cell_array[x][y] = value;
  }
  
  ArrayList<Cell> get_neighbours(int x, int y){
    
    ArrayList<Cell> neighbours = new ArrayList<>();
    
    for (int dx = -1; dx <= 1; dx++){
      for (int dy = -1; dy <= 1; dy++){
        neighbours.add(cell_array[(x + dx + grid_width) % grid_width][(y + dy + grid_height) % grid_height]);
      }
    }
    return get_neighbours;
  }
  
  Grid update(){
    
    Grid new_grid = new Grid(grid_width, grid_height);
    
    for (int x = 0; x < grid_width; x++){
      for (int y = 0; y < grid_height; y++){
        new_grid.set_cell(x, y, cell_array[x][y].update(get_neighbours(x, y)));
      }
    }
    return new_grid;
  }
  
  void display(){
    for (int x = 0; x < grid_width; x++){
      for (int y = 0; y < grid_height; y++){
        if (cell_array[x][y]){
          fill(0);
        }
        else{
          fill(255);
        }
        rect(cell_resolution * x, cell_resolution * y, cell_resolution, cell_resolution);
      }
    }
  }
  
  
  
  
}
