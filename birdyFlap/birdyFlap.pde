
int gameState = 0; 
/* 
gameState = 0: Starting screen 
gameState = 1: Game Screen 
gameState = 2: Ending Screen 
*/
PImage start, bird, background, pipe, pipeRotated, endScreen;

//bird variables 
int x = 150;
float y = 400;
float yv = 0;

//pipe variables 
float pX = 512.5;
float pY = random(-100, 179);
int speed = 3;

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
  endScreen = loadImage("Images/deathScreen.png");
  
}



void draw() {
  switch (gameState) {
   case 0: //Starting screen
     image(start, 0, 0);
     break;
     
   case 1: //Playing game 
     imageMode(CENTER);
     image(background, width/2, height/2);
     image(pipe, pX, 700 + pY);
     image(pipeRotated, pX, pY);
     textSize(28);
     fill(0);
     text("Score: " + score, 30, 50);
     text("High Score: " + highScore, 380, 50);
     image(bird, x, y, 50, 50);
     
     //collision logic
     
     //check prints
     if (x > pX && pX > 147) {
       System.out.println("Pipe Y position: " + (pY + 259) + " Pipe Y position: " + (700 + pY - 259));
       System.out.println("Bird Y position: " + y);
     }
     
     if (((x + 100) > pX && pX > 247 && (y < (pY + 259) || y > (700 + pY - 259))) || (y > 825)) {
       gameState = 2;
     }  else if (x < pX + 100 && x > pX - 100 && (y - 20 < (pY + 259) || y + 20 > (700 + pY - 259))) {
       gameState = 2; 
     }
     
     
     
     //bird stats 
     y += yv;
     yv += 0.3;
     
     //Scoring system 
     if (x > pX && pX >= (150 - speed)) {
       score ++; 
     }
     if (score > highScore) { //if current score is greater than the highScore make that the highSCore 
       highScore = score;
     }
     
     //pipe stats 
     if (score >= 3 && score < 5) {
      speed = 4; 
     } else if (score >= 5) {
      speed = 6; 
     }
     pX -= speed;
     System.out.println("Pipe x value: " + pX);
     if (pX < -87.5) {
      pX = 650;
      pY = random(-179, 279);
     }
     break;
     
   case 2: //Ending or Death screen
     imageMode(CENTER);
     image(endScreen, width/2, height/2);
     textSize(28);
     fill(0);
     text("Score: " + score, 235, 200);
     text("High Score: " + highScore, 200, 250);
     break;
    
  }
  
}

void keyPressed() { //handle bird movement with space bar press
  if (key == ' ') {
    yv -= 10;
    if (yv < -20) {
     yv += 5; 
    }
  }
}


void mousePressed() {
 if (gameState == 0) { //Start first game
  gameState = 1;  
 } else if (gameState == 2) { //play Again
  gameState =1; 
  //reset everything but High Score 
  score = 0; 
  pX = 650;
  y = 400;
  yv = 0;
  speed = 3;
 }
}
