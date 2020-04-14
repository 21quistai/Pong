class Player{
  int x, y; //
  int ySpeed = 5;
  int w, h;
  int score;
  
  public void drawPaddle(){
    fill(255);
    rect (x, y, w, h);
  }
  
  
  /** 
   * User input checks if the user is pressing the Up or down key\
   *@return -1 if the user is pressing the up key
   *@return 1 if the user is pressing the down key
   *@return 0 if the user isn't pressing anything or the wrong key
  */
  public int userInput(){
    if (keyPressed){
      if (keyCode == UP) return -1;
      else if (keyCode == DOWN) return 1;
      else return 0;
    }else return 0;
  }
  
  
  
 /** 
  * Checks what key the user is pressing with the userInput and checks if it not touching a wall
  * If it isn't then the paddle can move
  * If it is touching a wall it moves the paddle back so it can move again
 */
  public void movePaddle(){
    if (userInput() < 0 && hitWall() == 0){
        this.y -= this.ySpeed;
    } else if(userInput() > 0 && hitWall() == 0){
      this.y += this.ySpeed;
    } else if(hitWall() != 0){
      this.y += -1 * hitWall();
    }
  }
  
  /**
   *checks if the paddle is touching the top or bottom of the screen
   *IDK why I didn't just use a boolean??
   *@return -1 if the paddle is touching the top 
   *@return 1 if the paddle is touching the bottom
   *@return 0 if the paddle isn't touching any edge
  */
  
  public int hitWall(){
    if(this.y <= 0) return -1;
    else if (this.y + this.h >= height) return 1;
    else return 0;
  }
}