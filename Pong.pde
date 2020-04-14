
Player player = new Player();
Ball ball = new Ball(300, 300, 50);
Ball ball2 = new Ball(100, 400, 50);

void setup(){
  size(600, 600);
  smooth();
  noStroke();
  //surface.setResizable(true);
  player.x = 10;
  player.y = 10;
  player.w = 10;
  player.h = 100;
  
  
  
}

void draw(){
  //System.out.println(player.userInput());
  background(55);
  player.drawPaddle();
  player.movePaddle();
  
  ball.drawBall();
  ball.moveBall();
  ball.hitWall();
  ball.hitBall(ball2);
  
  ball2.drawBall();
  ball2.moveBall();
  ball2.hitWall();
}