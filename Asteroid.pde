class Asteroid{
  float x;
  float y;
  float velocity;
  float asteroidWidth;
  
  Asteroid ( float x, float y, float velocity){
    this.x = x;
    this.y = y;
    this.velocity = velocity;
    asteroidWidth = random(30, 100);
  }
  
  void display(){
    pushMatrix();
    translate(x, y);
    noFill();
    stroke(200, 255, 255, 180);
    ellipse(0 , 0, asteroidWidth, asteroidWidth);
    popMatrix();
  }
  
  void update(){
    y += velocity;
  }
  
  void shotCollision(Shot shot, Asteroid asteroid, int asteroidIndex, int shotIndex){
    if (dist(x, y, shot.x, shot.y) < asteroidWidth/2 + 2){
      shots.remove(shotIndex);
      asteroids.remove(asteroidIndex);
      score++;
    }
  }
  
  void playerCollision(Player ship, Asteroid asteroid){
    if (dist(x, y, ship.location.x, ship.location.y) < asteroidWidth/2 + 7){
      fill(255 , 180);
      ellipse(ship.location.x, ship.location.y, 200, 200);
      ship.alive = false;
      restart();
    }
    
  }
  
}