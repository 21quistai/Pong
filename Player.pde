class Player{
  protected int x, y; //position of the paddle from the top left corner
  protected int ySpeed; // speed that the paddle moves
  protected int w, h; // width + height of the paddle
  protected int score; // score of the player
  

	
  public Player (int x_, int y_, int w_, int h_, int ys){
    this.x = x_;
    this.y = y_;
    this.w = w_;
    this.h = h_;
    this.ySpeed = ys;
  }	  
  
  /** 
   * Displays the paddle. Duh
   */
  public void displayPaddle(){
    fill(255);
    rect (x, y, w, h);
  }
  
  /**
   *detects if the paddle is touching the top or bottom of the screen
   *@return -1 if the paddle is touching the top 
   *@return 1 if the paddle is touching the bottom
   *@return 0 if the paddle isn't touching any edge
  */
  public int hitWall(){
    if(this.y <= 0) return -1;
    else if (this.y + this.h >= height) return 1;
    else return 0;
  }
  
  // GETTERS / SETTERS
  
  //x//
  public int getX(){
    return this.x;
  }
  public void setX(int num){
    this.x = num;
  }
  
  //y//
  public int getY(){
    return this.y;
  }
  public void setY(int num){
    this.y = num;
  }
  
  //ySpeed//
  public int getYSpeed(){
    return this.ySpeed;
  }
  public void setYSpeed(int num){
    this.ySpeed = num;
  }
  
  //w//
  public int getW(){
    return this.w;
  }
  public void setW(int num){
    this.w = num;
  }
  
  //h//
  public int getH(){
    return this.y;
  }
  public void setH(int num){
    this.h = num;
  }
  
  //score//
  public int getScore(){
    return this.score;
  }
  public void setScore(int num){
    this.score = num;
  }
}


class User extends Player {
  
  
  User (int x, int y, int w, int h, int ySpeed){
    super (x, y, w, h, ySpeed);
  }
  
    /** 
   * Checks if the user is pressing the Up or down key
   * @return -1 if the user is pressing the up key
   * @return 1 if the user is pressing the down key
   * @return 0 if the user isn't pressing anything or the wrong key
   */
  public int userInput(){
    if (keyPressed){
      if (keyCode == UP) return -1;
      else if (keyCode == DOWN) return 1;
      else return 0;
    }else return 0;
  }
  
 /** 
  * Checks what key the user is pressing with the userInput and moves the paddle 
  * Then checks if the paddle is touching the wall to not move it
  */
  public void movePaddle(){
    if (userInput() < 0){
        super.y -= super.ySpeed;
        if(hitWall() == -1) this.y = 1;
        else if (hitWall() == 1) this.y = height - super.h;
    } else if(userInput() > 0){
      super.y += super.ySpeed;
      if(hitWall() == -1) super.y = 1;
      else if (hitWall() == 1) super.y = height - super.h ;
    } 
  }
  
  
}

class Bot extends Player {
  
  
  
  Bot (int x_, int y_, int w_, int h_, int ySpeed){
    super (x_, y_, w_, h_, ySpeed);
  }
  
  
  /** Checks all the balls in the game to find the one that is closest to the bot
   * @param the arrayList of balls in the game
   * @return the distance to the closest ball*/
  public float checkNearestBall(ArrayList <Ball> balls){
    float minDist = Integer.MAX_VALUE;
    float dist = 0;
    for (int i = 0; i < balls.size(); i++){
       dist = dist(balls.get(i).position.x, balls.get(i).position.y, super.x , super.y);
      if (minDist > dist) minDist = dist;
      
    }
    return dist;
  }
  
  
  boolean temp = true;
  
   /** 
  * Checks what key the user is pressing with the userInput and moves the paddle 
  * Then checks if the paddle is touching the wall to not move it
  */
  public void movePaddle(){
    if (temp){
        super.y -= super.ySpeed;
        if(hitWall() == -1) super.y = 1;
        else if (hitWall() == 1) super.y = height - super.h;
    } else if(!temp){
      super.y += super.ySpeed;
      if(hitWall() == -1) super.y = 1;
      else if (hitWall() == 1) super.y = height - super.h ;
    } 
  }
  
  
  
}
