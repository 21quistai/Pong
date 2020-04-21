class StartScreen {
  boolean startGame = false;
  Button start = new Button(width/2, height/2, 150, 50, "Start");
  Button twoPlayer = new Button (width/2, height/2 + 175, 150, 50, "2nd player");
    
  public void displaySS(){
    if (!startGame){
      rect(0, 0, width, height);
      start.display();
      twoPlayer.display();
    }
  }
  
  
}

class Button {
 
  color c = color (0);
  color t = color (255);
  
    

  int x;;
  int y;
  int w;
  int h;
  String text;
  
  public Button (int x_, int y_, int w_,int h_, String t){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = t;
  }
    
    
  public void display(){
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
  
  public boolean overStart(){
     if ((mouseX >= x - (w/2)) && (mouseX <= x - (w/2) + w && mouseY >= y - (h/2)) && (mouseY <= y - (h/2) + h)) {
       return true;
     } else return false;
  }
}
