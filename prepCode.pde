/*Prep code
Player:
  Variables: x, y, ySpeed, w, h, score
  
  Methods:
    
    drawPaddle
      draw a rectangle at x,y, w,h in white
      
    UserInput
        If it is the upKey
          return -1
        If it is the downKey
          return 1
        Else 
          return 0
          
     MovePaddle
       If Userinput > 0
         Move the paddle up
       If the user input is < 0
         Move the paddle down
       Else don't move it
       
     HitWall
       If the paddle is hitting the top
         return -1
       If the paddle is hitting the bottom
         return 1;
     
Ball:
  
  Variables: x, y, xSpeed, ySpeed, size,
  
  Methods:
    
    DrawBall
      ellipse at x,y size in white
      
    Move ball
      Move the ball by xSpeed and YSpeed
      Same as movePaddle

*/

//float testX = position.x;
   //float testY = position.y;
   
   //if (position.x < p.x)    testX = p.x; // left edge
   //else if (position.x > p.x + p.w) testX = p.x+p.w; // right edge
   
   //if (position.y < p.y)testY = p.y;        // top edge
   //else if (position.y > p.y+p.h) testY = p.y+p.h;     // bottom edge
   
   //float distX = position.x- testX;
   //float distY = position.y- testY;
   //float distance = sqrt( (distX*distX) + (distY*distY) );
   
   //if (distance <= radius) {
   //  println(true);
   //  //Figure out how to get if it is hitting a top or bottom border or left or right
   //  //if it is the top or bottom reflect the y velocity and x velocity if it is the left or right
   //}

    
