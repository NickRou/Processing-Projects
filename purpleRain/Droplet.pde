class Droplet {
  
 //variables 
 float x; 
 float y; 
 float ySpeed;
 float z; 
 
 
 
 Droplet() {
  x = random(1, 800); 
  y = random(-600, -100); 
  ySpeed = random(1.0, 1.5);
  z = random(4, 8);
   
   
 }
 
 void show() {
   stroke(186, 85 ,211);
   line(x, y, x, y + z);
   
 }
 
 
 void move() {
  y += ySpeed * z; 
  
  if (y > 600) {
   y = random(-400, -100);  
  }
   
 }
  
  
  
  
  
  
  
  
  
}
