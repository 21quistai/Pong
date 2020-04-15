int height = 600;
int width = 600;

int pw = width / 12;
int ph = height / 4;
int px = width - pw - 20;
int py = height /2 - ph / 2;

int bs = height / 20;
int bx = width / 2;
int by = height / 2;

Player player = new Player(px, py, pw, ph);
Ball ball = new Ball(300, 300, bs);
Ball ball1 = new Ball(400, 100, bs);


PVector mousePosition;

void setup(){
  size(600, 600);
  smooth();
  noStroke();
}

void draw(){

  background(55);
  player.drawPaddle();
  player.movePaddle();
  
 
  ball.moveBall();
  ball.wallCollision();
  ball.BallBallCollision(ball1);
  ball.drawBall();
  
  ball1.moveBall();
  ball1.wallCollision();
  ball1.drawBall();
}