class StartScreen {
  boolean startGame = false;
  Button start = new Button(width/2, height/2, 150, 50, "Start");
    
  public void displaySS(){
    if (!startGame){
      rect(0, 0, width, height);
      start.display();

    }
  }
  
  
}

class Button {
  color clicked = color(255);
  color norm = color (0);
  
    

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
    noFill();
    stroke(255);
    strokeWeight(4);
    rect (x - (w/2),y - (h/2) + 5,w,h);
    textAlign(CENTER, CENTER);
    textSize(30);
    text(text, x, y);
  }
  
  public boolean overStart(){
     if ((mouseX >= x - (w/2)) && (mouseX <= x - (w/2) + w && mouseY >= y - (h/2)) && (mouseY <= y - (h/2) + h)) {
       return true;
     } else return false;
  }
}
