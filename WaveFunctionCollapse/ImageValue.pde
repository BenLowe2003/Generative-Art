

class ImageValue{
  
  int value;
  
  boolean is_edge = false;
  
  boolean is_collapsed;
  
  int entropy;
  
  boolean[] is_tile_possible;
  
  ImageValue(int value){
    this.value = value;
    this.is_edge = false;
    this.is_collapsed = true;
  }
  
  ImageValue(ImageValue image_value){
    this.value = image_value.value;
  }
    
  ImageValue(){
    this.value = -1;
  }
  
  ImageValue(boolean is_edge){
    this.is_edge = is_edge;
  }
  
  ImageValue(Image[] possible_tiles){
    this.is_collapsed = false;
    this.entropy = possible_tiles.length;
    this.is_tile_possible = new boolean[entropy];
    for (int i = 0; i < this.entropy; i++){
      is_tile_possible[i] = true;
    }
    
  }
  
  void display(int x, int y){
    fill(value);
    rect(x, y, display_ratio, display_ratio);
  }
  
  int update_collapse_state(Image neighbourhood, Image[] tileset){
    
    if (is_collapsed == true){
      return 0;
    }
    
    for (int i = 0; i < is_tile_possible.length; i++){
      if (is_tile_possible[i]){
        Image tile = tileset[i];
        boolean is_same = tile.compare(neighbourhood);
        if (!is_same){
          is_tile_possible[i] = false;
          entropy--;
        }
      }
    }
    
    return entropy;
  }
      
  boolean compare(ImageValue other){
    if (this.is_collapsed == false || other.is_collapsed == false){
      return true;
    }
    else if (this.is_edge == other.is_edge){
      return true;
    }
    else if (this.value == other.value){
      return true;
    }
    else{
      return false;
    }
  }
  
}
