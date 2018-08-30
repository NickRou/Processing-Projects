float a = 0.0;
Box b;

ArrayList<Box> mengerSponge = new ArrayList<Box>();


void setup() {
  size(400, 400, P3D);
  b = new Box(0, 0, 0, 200);
  mengerSponge.add(b);
  
}

void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : mengerSponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  
  mengerSponge = next;
  
}


void draw() {
  background(0); 
  noStroke();
  lights();
  fill(255, 153, 51);
  
  translate(width/2, height/2); 
  rotateX(a);
  rotateY(a/2);
  rotateZ(a/4);
  for (Box b : mengerSponge) {
    b.show();
  }
  
  
  a += 0.01;
  
}
