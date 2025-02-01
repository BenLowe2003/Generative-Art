

class TerrainGeneratorCell extends Cell{
  
  TerrainGeneratorCell(boolean is_alive) {
    super(is_alive);
  }
  
  @Override
  boolean update(ArrayList<Cell> neighbours) {
    int total_living = 0;
    
    for (Cell neighbour : neighbours) {
      if (neighbour.is_alive) {
        total_living++;
      }
    }
    
    // Applying the rules of terrain generation
    if (super.is_alive) {
        return total_living >= 4; // Land survives if surrounded by 4 or more land cells
    } else {
        return total_living >= 5; // Water becomes land if surrounded by 5 or more land cells
    }
  }
}
  
