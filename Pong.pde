int height = 600;
int width = 600;

StartScreen screen = new StartScreen();

Button back = new Button (width - 150, height - 100, 100, 50, "Back");

boolean twoPlayer = false;
//Player stuff
int pw = width / 12;
int ph = height / 4;
int px = pw + 20;
int py = height /2 - ph / 2;
Player player = new Player(px, py, pw, ph, 5, true, 1);
Player bot = new Player(width - pw, py, pw, ph, 5, false, 2);


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
  println(twoPlayer);
}

void mousePressed(){
  if (screen.start.overStart() && !screen.startGame){
    screen.startGame = true;

  }
  if (back.overStart() && !screen.startGame){
    screen.startGame = false;
    player.score = 0;
    bot.score = 0;
  }
  
  if (screen.twoPlayer.overStart() && !screen.startGame){
    twoPlayer = !twoPlayer;
    bot.isPlayer = true;
    color temp = screen.twoPlayer.c;
    screen.twoPlayer.c = screen.twoPlayer.t;
    screen.twoPlayer.t = temp;
  }
  
}

public void game(){
  if(screen.startGame && !endGame()){
     updateScore();
    
    player.displayPaddle();
    player.movePaddle(balls);
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
    if (balls.get(i).goalCollision() == -1){
      //update main players score
      player.score ++;  
      reset(balls.get(i));
    } else if (balls.get(i).goalCollision() == 1){
      bot.score ++;
      reset(balls.get(i));
    }
  }
}

/**
 * resets the ball to the middle of the sceen*/
public void reset(Ball b){
    b.position.x = width/2;
    b.position.y = height/2;
    b.velocity = PVector.random2D();
    //b.setPosition(new PVector(width/2, height/2));
    //balls.get(i).setVelocity(PVector.random2D()); // if you want a random speed each time uncomment
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
