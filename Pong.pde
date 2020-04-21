int height = 600;
int width = 600;

StartScreen screen = new StartScreen();

Button back = new Button (width - 150, height - 100, 100, 50, "Back");


//Player stuff
int pw = width / 12;
int ph = height / 4;
int px = pw + 20;
int py = height /2 - ph / 2;
User player = new User(px, py, pw, ph, 5);
Bot bot = new Bot(width - pw, py, pw, ph, 5);


//Ball stuff
PVector bp = new PVector(width/2, height/2);
int bs = height / 20;
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(600, 600, FX2D);
  smooth();
  noStroke();
  
  screen.displaySS();
  
  balls.add(new Ball (bp.x, bp.y,  bs));
  balls.add(new Ball (bp.x - 100, bp.y - 100 ,bs));
}

void draw(){
  background(0);
  game();
  screen.displaySS();
  score();
}

void mousePressed(){
  if (screen.start.overStart()){
    screen.startGame = true;

  }
  if (back.overStart()){
    screen.startGame = false;
    player.score = 0;
    bot.score = 0;
  }
  
}

public void game(){
  if(screen.startGame && !endGame()){
     updateScore();
    
    player.displayPaddle();
    player.movePaddle();
    bot.displayPaddle();
    bot.movePaddle(balls);
  
   for (Ball b : balls){
     b.moveBall();
     b.wallCollision();
     b.paddleCollision(player);
     b.paddleCollision(bot);
     b.drawBall();
   }
  }
}


/**
 * updates the score when the ball passes the 
 * left and right wall*/
public void updateScore(){
  for (int i = 0; i < balls.size(); i++){
    if (balls.get(0).goalCollision() == -1){
      //update main players score
      player.score ++;  
      reset();
    } else if (balls.get(0).goalCollision() == 1){
      bot.score ++;
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


public void score(){
  if (!endGame()){
    text(player.score, 75,20);
    text(bot.score, width - 75, 20);
  }
}

public boolean endGame(){
  
  
  if (player.score >= 10 || bot.score >= 10){
    textAlign(CENTER);
    text((player.score >=10) ? "Player 1" : "BOT", width/2, height/2);
    text ("WON!", width/2, height/2 + 30);
    back.display();
    return true;
  }
  return false;
}
