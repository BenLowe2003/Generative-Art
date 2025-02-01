

class Maze{
  ArrayList<ArrayList<MazeDirection>> mazeArray = new ArrayList<>();
  
  int[] end_cell = {0, 0};
  int just_visited = 0;
  
  Maze(){
    for (int x = 0; x < grid_width; x++){
      mazeArray.add(new ArrayList<MazeDirection>());
      for (int y = 0; y < grid_height; y++){
        if (x == 0){
          if (y == 0){
          mazeArray.get(x).add(MazeDirection.SELF);
          }
          else{
            mazeArray.get(x).add(MazeDirection.MAZEUP);
          }
        }
        else{
          mazeArray.get(x).add(MazeDirection.MAZELEFT);
        }
      }
    }
  }
  
  void display(){
    stroke(0,0,0);
    strokeWeight(4);
    for (int x = 0; x < grid_width; x++){
      for (int y = 0; y < grid_height; y++){
        MazeDirection cell_direction = mazeArray.get(x).get(y);
        draw_direction(cell_direction, x, y);
      }
    }
    strokeWeight(1);
  }
  
  // {MazeDirection.MAZEUP, MazeDirection.MAZEDOWN, MazeDirection.MAZELEFT, MazeDirection.MAZERIGHT}
  
  void mutate(){
    boolean[] options = {true, true, true, true};
    MazeDirection new_value;
    
    options[just_visited] = false;
    
    // Remove options if there's no cell their
    if (end_cell[0] == 0){
      options[3] = false; // Remove up if on the top row
    }
    if (end_cell[1] == 0){
      options[0] = false; // Remove LEFT if on left column
    }
    if (end_cell[0] == grid_width - 1){
      options[1] = false; // Remove RIGHT if on RIGHT column
    }
    if (end_cell[1] == grid_height - 1){
      options[2] = false; // Remove DOWN if on BOTTOM column
    }
    
    // choose a random option from those remaining.
    boolean new_value_found = false;
    int new_value_index = 0;
    while (new_value_found == false){
      new_value_index = (int) random(0,4);
      if (options[new_value_index]){
        new_value_found = true;
      }
    }

    // Change cell values based on the option chosen
    switch (new_value_index){
      case 0: // UP
        mazeArray.get(end_cell[0]).set(end_cell[1] - 1, MazeDirection.SELF);
        mazeArray.get(end_cell[0]).set(end_cell[1], MazeDirection.MAZEUP);
        end_cell = new int[]{end_cell[0], end_cell[1] - 1};
        just_visited = 2;
        break;
       case 1: // RIGHT
        mazeArray.get(end_cell[0] + 1 ).set(end_cell[1], MazeDirection.SELF);
        mazeArray.get(end_cell[0]).set(end_cell[1], MazeDirection.MAZERIGHT);
        end_cell = new int[]{end_cell[0] + 1, end_cell[1]};
        just_visited = 3;
        break;
       case 2: // DOWN
        mazeArray.get(end_cell[0]).set(end_cell[1] + 1, MazeDirection.SELF);
        mazeArray.get(end_cell[0]).set(end_cell[1], MazeDirection.MAZEDOWN);
        end_cell = new int[]{end_cell[0], end_cell[1] + 1};
        just_visited = 0;
        break;
       case 3: // LEFT
        mazeArray.get(end_cell[0] - 1 ).set(end_cell[1], MazeDirection.SELF);
        mazeArray.get(end_cell[0]).set(end_cell[1], MazeDirection.MAZELEFT);
        end_cell = new int[]{end_cell[0] - 1, end_cell[1]};
        just_visited = 1;
        break;
    }
  }
  
  void mutate(int mutations){
    for (int i = 0; i < mutations; i++){
      mutate();
    }
  }
  
  HashMap<MazeDirection, Boolean> get_neighbours(int x, int y){
    
    // Create a hashmap to store all the values MAZE
    HashMap<MazeDirection, Boolean> neighbours = new HashMap<MazeDirection, Boolean>();
    neighbours.put(MazeDirection.MAZEUP, true);
    neighbours.put(MazeDirection.MAZEDOWN, true);
    neighbours.put(MazeDirection.MAZELEFT, true);
    neighbours.put(MazeDirection.MAZERIGHT, true);
    
    // can't go to edges.
    if (x == 0)               {neighbours.put(MazeDirection.MAZELEFT, false) ;};
    if (x == grid_width - 1)  {neighbours.put(MazeDirection.MAZERIGHT, false);};
    if (y == 0)               {neighbours.put(MazeDirection.MAZEUP, false)   ;};
    if (y == grid_height - 1) {neighbours.put(MazeDirection.MAZEDOWN, false) ;};
    
    // println("x:", x, "y:", y);
    // println(neighbours);
    
    // Check if neightboring cells point to this cell
    if (neighbours.get(MazeDirection.MAZEUP))    {if (mazeArray.get(x).get(y-1) != MazeDirection.MAZEDOWN)   {neighbours.put(MazeDirection.MAZEUP, false);}} // check UP
    if (neighbours.get(MazeDirection.MAZERIGHT)) {if (mazeArray.get(x+1).get(y) != MazeDirection.MAZELEFT)   {neighbours.put(MazeDirection.MAZERIGHT, false);}} // check RIGHT
    if (neighbours.get(MazeDirection.MAZEDOWN))  {if (mazeArray.get(x).get(y+1) != MazeDirection.MAZEUP)     {neighbours.put(MazeDirection.MAZEDOWN, false);}} // check DOWN
    if (neighbours.get(MazeDirection.MAZELEFT))  {if (mazeArray.get(x-1).get(y) != MazeDirection.MAZERIGHT)  {neighbours.put(MazeDirection.MAZELEFT, false);}} // check LEFT
    
    // check if this cell points to neighboring cells
    switch (mazeArray.get(x).get(y)){
      case MAZEUP: neighbours.put(MazeDirection.MAZEUP, true); break;
      case MAZERIGHT: neighbours.put(MazeDirection.MAZERIGHT, true); break;
      case MAZEDOWN: neighbours.put(MazeDirection.MAZEDOWN, true); break;
      case MAZELEFT: neighbours.put(MazeDirection.MAZELEFT, true); break;
    }
    
    return neighbours;
  }
  
  

    
}
