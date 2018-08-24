

//array of droplets 
Droplet[] dropletList = new Droplet[700];



void setup() {
  size(800, 600); 
  for (int i=0; i < dropletList.length; i++) {
   dropletList[i] = new Droplet(); 
    
  }
  
  
  
  
}



void draw() {
  background(216, 191, 216);
  for (int i=0; i < dropletList.length; i++) {
   dropletList[i].move();
   dropletList[i].show();
    
  }
  
  
  
}
