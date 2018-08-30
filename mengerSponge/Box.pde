public class Box {
 
  PVector pos; 
  float s;
  
  Box(float x, float y, float z, float s_) {
    pos = new PVector(x, y, z);
    s = s_; 
  }
  
  ArrayList generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
   for (int i=-1; i < 2; i++) {
     for (int j=-1; j < 2; j++) {
       for (int k=-1; k < 2; k++) {
         
         int sum = abs(i) + abs(j) + abs(k);

         float newSize = s/3;
         if (sum > 1) {
           Box b = new Box(pos.x + i * newSize, pos.y + j * newSize, pos.z + k * newSize, newSize);
           boxes.add(b);
         }
         
       
       }
     } 
   }
   return boxes;
  }
  
  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z); 
    box(s);
    popMatrix();
  }


}
  
