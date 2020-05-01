class StartScreen {
  boolean startGame = false; // if the screen should appear or not
  Button start = new Button(width/2, height/2, 150, 50, "Start"); // creates the start button
  Button twoPlayer = new Button (width/2, height/2 + 175, 150, 50, "2nd player"); //creates the two player option
  
  
  //Displays the start screen  
  public void displaySS(){
    if (!startGame){
      rect(0, 0, width, height);
      start.displayBtn();
      twoPlayer.displayBtn();
    }
  }
}

class Button {
  color c = color (0); // sets the color to black
  color t = color (255); // sets the color to white // not sure if this is used
  
  int x; // X postion of the paddle from the top left
  int y; // Y postion of the paddle from the top left
  int w; // Width of the button
  int h; // Height of the paddle
  String text; // What the button says
  
  public Button (int x_, int y_, int w_,int h_, String t){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = t;
  }
    
  /**
   * Sets the color to black and the border to white
   * Displays the rectangle and then sets the color to white
   * Then displays the text, sets it back to black*/
  public void displayBtn(){
    fill(c);
    stroke(255);
    strokeWeight(4);
    rect (x - (w/2),y - (h/2) + 5,w,h);
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(t);
    text(text, x, y);
    fill(0);
  }
  
  /**
   * Checks if the mouse is over the button
   * @return true if it is
   * @return false if it isn't*/
  public boolean overBtn(){
     if ((mouseX >= x - (w/2)) && (mouseX <= x - (w/2) + w && mouseY >= y - (h/2)) && (mouseY <= y - (h/2) + h)) {
       return true;
     } else return false;
  }
}
