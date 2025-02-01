

float z = 0;
float scale = 0.01;

void setup() {
  size(800, 800, P2D);  // Ensures draw() is called only once
  noiseDetail(9, 0.5);
  colorMode(HSB);
}

void draw() {
  z++;
  loadPixels();  // Load the pixel array for manipulation
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float noiseValue = noise(x * scale, y * scale, z * scale);  // Generate noise value
      
      color colour = color(0, 0, 0);
      if (noiseValue < 0.3){
        colour = lerpColor(color(0, 0, 255), color(0,0,0),  noiseValue * 1/0.5);
      }
      else if (noiseValue < 0.5){
        colour = lerpColor(color(80,50,100), color(120,20,96) , 2 * noiseValue);
      }
      else{
        colour = lerpColor(color(100,200,255), color(0, 0, 100), noiseValue);
      } // Scale noise value to 0-255 range
      pixels[x + y * width] = colour;  // Set pixel color based on noise value
    }
  }
  updatePixels();  // Update the display with the modified pixel array
}
