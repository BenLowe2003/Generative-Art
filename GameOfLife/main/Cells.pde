

class Cell {
  boolean is_alive;
  
  Cell(boolean is_alive) {
    this.is_alive = is_alive;
  }
  
  boolean update(ArrayList<Cell> neighbours) {
    int total_living = 0;
    
    for (Cell neighbour : neighbours) {
      if (neighbour.is_alive) {
        total_living++;
      }
    }
    
    // Applying the rules of Conway's Game of Life
    if (is_alive) {
      if ((total_living == 3) || (total_living == 4)) {
        return true; // Cell survives
      } else {
        return false; // Cell dies due to overpopulation or underpopulation
      }
    } else {
      if (total_living == 3) {
        return true; // Cell becomes alive due to reproduction
      } else {
        return false; // Cell remains dead
      }
    }
  }
}
