class Star {
  //varialbes 
  float x; 
  float y; 
  float z; 
  PVector v1;
  
  
  //constructor 
  Star() {
  x = random(150, 250); 
  y = random(150, 250); 
  z = 0.1;
  v1  = PVector.random2D();
  
  }
  
  
  void drawStar() {
    ellipse(x, y, 10 * z, 10 * z);
  
  }
  
  void moveStar() {
    x += v1.x * 2;
    y += v1.y * 2;
    z += 0.005;
    if (x > width || y > height || x < 1 || y < 1) {
      x = random(180, 220);
      y = random(180, 220); 
      z = 0.1;
    }

  
  
  }
  
  
  





}
