class Ball{
  private PVector position;
  private PVector velocity;
  
  private float radius; // The radius of the ball
  public float m; //middle i think
  
  public Ball (float x, float y, int r){
    position = new PVector (x, y);
    velocity = new PVector (0,0);
    //velocity = PVector.random2D();// use this for final version
    velocity.mult(3);
    radius = r;
    m = radius*.1;
  }
  
  public void drawBall(){
    ellipse(position.x,position.y, radius*2, radius*2);
  }
  
  public void moveBall(){
    position.add(velocity);
  }
  
  
  public void wallCollision(){
 if (position.y > height-radius) {
      position.y = height-radius;
      velocity.y *= -1;
    } else if (position.y < radius) {
      position.y = radius;
      velocity.y *= -1;
    } else if (position.x > width-radius) {
      position.x = width-radius;
      velocity.x *= -1;
    } else if (position.x < radius) {
      position.x = radius;
      velocity.x *= -1;
    }
  }
  
  void BallBallCollision(Ball other){
    // Calculates the distance between the two balls
    PVector distanceBtwn = PVector.sub(other.position, position);
    
    // Calculates the distanceBtwn as a magnatude
    float distanceBtwnMag = distanceBtwn.mag();
    
    // Calculates the minimum distance until the two balls are touching
    float minDistance = radius + other.radius;
    
    if (distanceBtwnMag < minDistance){
      float distanceCorrection = (minDistance-distanceBtwnMag)/2.0;
      PVector d = distanceBtwn.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      other.position.add(correctionVector);
      position.sub(correctionVector);
      
      float theta = distanceBtwn.heading();
      System.out.println(theta);
      float sine = sin(theta);
      float cosine = cos(theta);
      
      
      /* bTemp will hold rotated ball positions. You 
       just need to worry about bTemp[1] position*/
      PVector[] bTemp = {
        new PVector(), new PVector()
      };  
      
      /* this ball's position is relative to the other
       so you can use the vector between them (bVect) as the 
       reference point in the rotation expressions.
       bTemp[0].position.x and bTemp[0].position.y will initialize
       automatically to 0.0, which is what you want
       since b[1] will rotate around b[0] */
      bTemp[1].x  = cosine * distanceBtwn.x + sine * distanceBtwn.y;
      bTemp[1].y  = cosine * distanceBtwn.y - sine * distanceBtwn.x;
      
      
      //rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
      }; 
      
      vTemp[0].x = cosine * other.velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * other.velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * velocity.x + sine * other.velocity.y;
      vTemp[1].y  = cosine * velocity.y - sine * other.velocity.x;
      
      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final velocity along the x-axis. */
      PVector[] vFinal = {  
        new PVector(), new PVector()
      };
      
      // final rotated velocity for b[0]
      vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
      vFinal[0].y = vTemp[0].y;
      
      // final rotated velocity for b[0]
      vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
      vFinal[1].y = vTemp[1].y;
      
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;
      
      /* Rotate ball positions and velocities back
       Reverse signs in trig expressions to rotate 
       in the opposite direction */
      // rotate balls
      PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      // update balls to screen position
      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update balls to screen position
      other.position.x = position.x + bFinal[1].x;
      other.position.y = position.y + bFinal[1].y;

      position.add(bFinal[0]);

      // update velocities
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
    }
    
  }
  
  //GETTERS / SETTERS
  
  
  //radius//
  public float getRadius(){
    return radius;
  }
  public void setRadius(float num){
    radius = num;
  }
  
  //position//
  public PVector getPosition(){
    return position;
  }
  public void setPosition(PVector thing){
    position = thing;
  }
  
  //velocity//
  public PVector getVelocity(){
    return velocity;
  }
  public void setVelocity(PVector thing){
    velocity = thing;
  }
  
}