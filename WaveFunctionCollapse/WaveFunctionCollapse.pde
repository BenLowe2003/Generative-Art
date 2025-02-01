
int tile_radius = 2;
int input_width = 5;
int input_height = 5;
int output_width = 10;
int output_height = 10;
int display_ratio = 200;

Image image;
Image[] tile_set;

void setup(){
  
  size(1000, 1000);
  
  image = new Image(2, 2);
  
  image.set(new ImageValue(0), 0, 0);
  image.set(new ImageValue(100), 1, 0);
  image.set(new ImageValue(200), 0, 1);
  image.set(new ImageValue(255), 1, 1);
  
  tile_set = image.create_tileset();
}

void draw(){
  background(255);
  tile_set[2].display();
}
