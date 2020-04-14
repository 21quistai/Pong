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