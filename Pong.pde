int height = 600;
int width = 600;

//Player stuff
int pw = width / 12;
int ph = height / 4;
int px = pw + 20;
int py = height /2 - ph / 2;
Player player = new Player(px, py, pw, ph);
Player bot = new Player(width - pw, py, pw, ph);


//Ball stuff
PVector bp = new PVector(width/2, height/2);
int bs = height / 20;
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(600, 600, FX2D);
  smooth();
  noStroke();
  
  balls.add(new Ball (bp.x, bp.y,  bs));
}

void draw(){
  background(55);
  
  updateScore();
  
  player.displayPaddle();
  player.movePaddle();
  bot.displayPaddle();
  bot.movePaddle();
  
 
  balls.get(0).moveBall();
  balls.get(0).wallCollision();
  balls.get(0).paddleCollision(player);
  balls.get(0).paddleCollision(bot);
  balls.get(0).drawBall();

}


/**
 * updates the score when the ball passes the 
 * left and right wall*/
public void updateScore(){
  for (int i = 0; i < balls.size(); i++){
    if (balls.get(0).goalCollision() == -1){
      //update main players score
      bot.score ++;  
      reset();
    } else if (balls.get(0).goalCollision() == 1){
      player.score ++;
      reset();
    }
  }
}

/**
 * resets the ball to the middle of the sceen*/
public void reset(){
  for (int i = 0; i < balls.size(); i++){
    balls.get(i).setPosition(new PVector(width/2, height/2));
    //balls.get(i).setVelocity(PVector.random2D()); // if you want a random speed each time uncomment
  }
}
