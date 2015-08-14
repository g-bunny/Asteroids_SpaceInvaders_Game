class Shot{
  float x, y;
  float velocity;
  int lifeSpan;
  int runtime;
  
  Shot(float x, float y, float velocity){
    this.x = x;
    this.y = y;
    this.velocity = velocity;
    lifeSpan = 100;
    runtime = 0;
  }
  void display(){
    pushMatrix();
    translate(x , y);
    fill(200, 255, 255);
    ellipse(0, 0, 4, 4);
    popMatrix();
  }
  
  void update(){
    y += velocity;
  }
  
  void destroyShot(int index){
    runtime ++;
    if (runtime > lifeSpan){
      shots.remove(index);
    }
    
  }
}