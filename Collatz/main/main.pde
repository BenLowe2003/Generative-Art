import processing.pdf.*;





void setup() {
  
  
  size(800, 600);
  background(0);
  for (int i = 1; i < 10000; i++) { 
    IntList sequence = new IntList();
    int n = i;
    
    // find the collatz sequence for i
    while (n != 1){
      sequence.append(n);
      n = collatz(n);
    }
    sequence.append(1);
    sequence.reverse(); 
    
    
    int len = 4;
    float angle = 0.03;
    resetMatrix();
    translate(len, height);
    for (int j = 0; j < sequence.size(); j++) {
      int value = sequence.get(j);
      if (value % 2 == 0) {
        rotate(angle);
      } else {
        rotate(-angle);
      }
      strokeWeight(2);
      stroke(255, 10);
      line(0, 0, 0, -len);
      translate(0, -len);
    }
  }
  
  
}

void draw(){
  beginRecord(PDF, "collatzRender.pdf");
  endRecord();
  noLoop();
}


int collatz(int n) {
  // even
  if (n % 2 == 0) {
    return n / 2;
    // odd
  } else {
    return n * 3 + 1;
  }
}
