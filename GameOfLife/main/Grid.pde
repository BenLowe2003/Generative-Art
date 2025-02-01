class Grid {
  
  ArrayList<Cell>[][] cell_array;
  int grid_width;
  int grid_height;
  int cell_resolution;
  
  Grid(int grid_width, int grid_height, int cell_resolution) {
    this.grid_width = grid_width;
    this.grid_height = grid_height;
    this.cell_resolution = cell_resolution;
    
    this.cell_array = new ArrayList[grid_width][grid_height];
    
    for (int x = 0; x < grid_width; x++) {
      for (int y = 0; y < grid_height; y++) {
        this.cell_array[x][y] = new ArrayList<>();
        this.cell_array[x][y].add(new TerrainGeneratorCell(random.nextDouble() < random_probability));
      }
    }
  }
  
  void set_cell(int x, int y, boolean new_value) {
    this.cell_array[x][y].get(0).is_alive = new_value;
  }
  
  ArrayList<Cell> get_neighbours(int x, int y) {
    ArrayList<Cell> neighbours = new ArrayList<>();
    
    for (int dx = -1; dx <= 1; dx++) {
      for (int dy = -1; dy <= 1; dy++) {
        int nx = (x + dx + grid_width) % grid_width;
        int ny = (y + dy + grid_height) % grid_height;
        neighbours.add(cell_array[nx][ny].get(0));
      }
    }
    return neighbours;
  }
  
  Grid update() {
    Grid new_grid = new Grid(grid_width, grid_height, cell_resolution);
    
    for (int x = 0; x < grid_width; x++) {
      for (int y = 0; y < grid_height; y++) {
        new_grid.set_cell(x, y, cell_array[x][y].get(0).update(get_neighbours(x, y)));
      }
    }
    return new_grid;
  }
  
  void display() {
    for (int x = 0; x < grid_width; x++) {
      for (int y = 0; y < grid_height; y++) {
        if (cell_array[x][y].get(0).is_alive) {
          fill(0);
        } else {
          fill(255);
        }
        rect(cell_resolution * x, cell_resolution * y, cell_resolution, cell_resolution);
      }
    }
  }
  
  void reset(){
    for (int x = 0; x < grid_width; x++) {
      for (int y = 0; y < grid_height; y++) {
        set_cell(x, y, false);
      }
    }
  }
}
