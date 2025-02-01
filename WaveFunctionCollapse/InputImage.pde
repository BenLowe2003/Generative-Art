

class Image{
  
  ImageValue[][] image;
  
  int image_width;
  int image_height;
  
  Image (int image_width, int image_height){
    this.image = new ImageValue[image_width][image_height];
    this.image_width = image_width;
    this.image_height = image_height;
  }
  
  Image(int image_width, int image_height, Image[] tileset){
    this.image = new ImageValue[image_width][image_height];
    this.image_width = image_width;
    this.image_height = image_height;
    for (int x = 0; x < image_width; x++){
      for (int y = 0; y < image_height; y++){
        image[x][y] = new ImageValue(tileset);;
      }
    }
  }
  
  void set(ImageValue value, int x, int y){
    image[x][y] = new ImageValue(value);
  }
  
  ImageValue get(int x, int y){
    return image[x][y];
  }
  
  void display(){
    for (int x = 0; x < image_width; x++){
      for (int y = 0; y < image_height; y++){
        image[x][y].display(x * display_ratio, y * display_ratio);
      }
    }
  }
  
  Image get_neighbourhood(int x, int y, int neighbourhood_radius){
    int neighbourhood_size = 2 * neighbourhood_radius - 1;
    Image neighbourhood = new Image(neighbourhood_size, neighbourhood_size);
    for (int dx = 1-neighbourhood_radius; dx < neighbourhood_radius ; dx++){
      for (int dy = 1-neighbourhood_radius; dy < neighbourhood_radius ; dy++){
        if (x + dx >= 0 && x + dx < image_width && y + dy >= 0 && y + dy < image_height){
          neighbourhood.set(image[x+dx][y+dy], dx + neighbourhood_radius - 1 , dy + neighbourhood_radius - 1);
        }
        else{
          neighbourhood.set(new ImageValue(true), dx + neighbourhood_radius - 1 , dy + neighbourhood_radius - 1);
        }
      }
    }
    return neighbourhood;
  }
    
  
  Image[] create_tileset(){
    Image[] tile_set = new Image[image_width * image_height];
    for (int x = 0; x < image_width; x++){
      for (int y = 0; y < image_height; y++){
        tile_set[x + image_width * y] = get_neighbourhood(x, y, tile_radius) ;
      }
    }
    return tile_set;
  }
  
  boolean compare(Image other){ // you need to account for edges and 
    boolean is_same = true;
    for (int x = 0; x < image_width; x++){
      for (int y = 0; y < image_height; y++){
        if (this.image[x][y].compare(other.image[x][y])){
          return false;
        }
      }
    }
    return is_same;
  }
}



    
