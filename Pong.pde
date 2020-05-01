int height = 600;
int width = 600;

// Creates the start screen
StartScreen screen = new StartScreen();

// Creates the back button when the game ends
Button back = new Button (width - 150, height - 100, 100, 50, "Back");


//Player stuff
boolean twoPlayer = false; // Is true if two people are playing 
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

/**create the screen, make the objects look smooth and add the balls */
void setup(){
  size(600, 600, FX2D);
  smooth();
  noStroke();
 
  // Adds the balls to the arrayList
  balls.add(new Ball (bp.x, bp.y,  bs));
  balls.add(new Ball (bp.x - 100, bp.y - 100 ,bs));
}

void draw(){
  background(0);
  screen.displaySS();
  game();
  score();
}

/** runs when the mouse is pressed*/
void mousePressed(){
  //checks if the player pressed the start button
  if (screen.start.overBtn() && !screen.startGame){
    screen.startGame = true;
  }
  
  //checks if the player pressed the back button when the game is over
  //Resets the score
  if (back.overBtn() && screen.startGame){
    screen.startGame = false;
    player.score = 0;
    bot.score = 0;
  }
  
  //Checks if there are two players or one and a bot
  if (screen.twoPlayer.overBtn() && !screen.startGame){
    twoPlayer = !twoPlayer;
    bot.isPlayer = !bot.isPlayer;
    color temp = screen.twoPlayer.c;
    screen.twoPlayer.c = screen.twoPlayer.t;
    screen.twoPlayer.t = temp;
  }
}

/** This holds the majority of the methods. It displays,
 * moves, and collides the balls and paddles */
public void game(){
  if(screen.startGame && !endGame()){
    updateScore();
    
    // Player stuff
    player.displayPaddle();
    player.movePaddle(balls);
    bot.displayPaddle();
    bot.movePaddle(balls);
    
    // Ball stuff
    for (Ball b : balls){
      b.moveBall();
      b.wallCollision();
      b.paddleCollision(player);
      b.paddleCollision(bot);
      b.displayBall();
   }
  }
}


/**
 * updates the score when the ball passes the 
 * left and right wall and resets the balls position*/
public void updateScore(){
  for (int i = 0; i < balls.size(); i++){
    //updates player 1's score
    if (balls.get(i).goalCollision() == -1){
      player.score ++;  
      reset(balls.get(i));
      
      //updates player 2's score
    } else if (balls.get(i).goalCollision() == 1){
      bot.score ++;
      reset(balls.get(i));
    }
  }
}

/** resets the ball to the middle of the sceen*/
public void reset(Ball b){
    b.position.x = width/2;
    b.position.y = height/2;
    b.velocity = PVector.random2D();  // if you don't want a random velocity comment out this line
}


/** Displays the score at the top of the screen */
public void score(){
  if (!endGame()){
    text(player.score, 75,20);
    text(bot.score, width - 75, 20);
  }
}


/** checks to see if either player has 10 points and displays who won
 * @return true if someone has 10 points
 * @return false if not*/
public boolean endGame(){
  if (player.score >= 10 || bot.score >= 10){
    fill(255);
    textAlign(CENTER);
    text((player.score >=10) ? "Player 1" : "BOT", width/2, height/2);
    text ("WON!", width/2, height/2 + 30);
    fill(0);
    back.displayBtn();
    return true;
  }
  return false;
}
