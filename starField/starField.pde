

Star[] starList = new Star[100];



void setup() {
  size(400, 400);
  for (int i=0; i<starList.length; i++) {
    starList[i] = new Star();
  }


}

void draw() {
  background(0);
  for (int i=0; i<starList.length; i++) {
    starList[i].drawStar();
    starList[i].moveStar();
  }
  


}
