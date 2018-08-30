
int gameState = 0; 
/* 
gameState = 0: Starting screen 
gameState = 1: Game Screen 
gameState = 2: Ending Screen 
*/
PImage start, bird, background, pipe, pipeRotated;

//bird variables 
int x = 150;
float y = 400;
float yv = 0;

//pipe variables 
float pX = 512.5;
float pY = random(-100, 179);

//score 
int score = 0; 
int highScore = 0; 



void setup() {
  size(600, 800);
  start = loadImage("Images/startScreen.png");
  bird = loadImage("Images/bird.png");
  background = loadImage("Images/background.png");
  pipe = loadImage("Images/pipe.png");
  pipeRotated = loadImage("Images/pipeRotated.png");
  
}



void draw() {
  switch (gameState) {
   case 0: //Starting screen
     image(start, 0, 0);
     break;
   case 1: //Playing game 
     imageMode(CENTER);
     image(background, width/2, height/2);
     image(pipe, pX, 800 + pY);
     image(pipeRotated, pX, pY);
     textSize(28);
     fill(0);
     text("Score: " + score, 30, 50);
     text("High Score: " + highScore, 380, 50);
     image(bird, x, y, 50, 50);
     
     //collision logic 
     if (x > pX && pX > 147) {
       System.out.println("Pipe Y position: " + (pY + 259) + " Pipe Y position: " + (800 + pY - 259));
       System.out.println("Bird Y position: " + y);
     }
     
     if (x > pX && pX > 147 && y > (pY + 259) && y < (800 + pY - 259)) {
       
     } else {
       gameState = 2;   
     }
     
     
     
     //bird stats 
     y += yv;
     yv += 0.3;
     //Scoring system 
     if (x > pX && pX > 147) { //if bird makes it through the gap in the pipes score ++ 
      score ++;
      if (score > highScore) { //if current score is greater than the highScore make that the highSCore 
        highScore = score;
      }
     }
     
     //pipe stats 
     pX -= 3;
     if (pX < -87.5) {
      pX = 650;
      pY = random(-179, 179);
     }
     break;
   case 2: //Ending or Death screen
     fill(0);
     break;
    
  }
  
}

void keyPressed() {
  if (key == ' ') {
    yv -= 10;
    if (yv < -20) {
     yv += 5; 
    }
  }
}


void mousePressed() {
 if (gameState == 0) {
  gameState = 1;  
 } 
}
