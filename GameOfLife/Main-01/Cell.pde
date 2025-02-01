

class Cell{
  
  boolean is_alive;
  
  Cell(boolean temp_is_alive){
    is_alive = temp_is_alive;
  }
  
  Cell update(ArrayList<Cell> neighbours){
    int total_living = 0;
    Cell out;
    for (Cell neighbour : neighbours){
      if (neighbour.is_alive){
        total_living++;
      }
      if (is_alive){
        if ((total_living == 2) | (total_living == 3)){
          return new Cell(true);
        }
        else {
          return new Cell(false);
        }
      }
      if (! is_alive){
        if (total_living == 3){
          return new Cell(true);
        }
        else{
          return new Cell(false);
        }
      }
    }
  }
}
