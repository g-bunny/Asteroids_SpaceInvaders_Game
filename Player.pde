class Player {
  PVector location;
  PVector velocity;
  float maxVelocity;
  float shotTimer;
  float shotRate;
  boolean alive = true;

  Player(PVector location) {
    this.location = location;
    maxVelocity = 10;
    velocity = new PVector (0, 0);
    shotRate = 10;
    shotTimer = 0;
  }

  void display() {
    if (alive == true) {
      location.add(velocity);
      pushMatrix();
      translate(location.x, location.y);
      stroke(200, 255, 255, 180);
      //    point(0, -12);
      //    point(8, 8);
      //    point( -8, 8);
      triangle(0, -12, 8, 8, -8, 8);
      popMatrix();
    }
  }

  void update() {
    if (alive == true) {
      if (location.x >= width) {
        location.x = 0;
      } else if (location.x <= 0) {
        location.x = width;
      }

      if (keyLeft == true) {
        velocity.x -= 0.5;
      } else if (keyRight == true) {
        velocity.x += 0.5;
      } else {
        velocity.x -= velocity.x * 0.1;
      }

      if (velocity.x >= maxVelocity) {
        velocity.x = maxVelocity;
      }
      if (keyShoot == true) {
        if (shotTimer == 0) {
          shoot();
          shotTimer = shotRate;
        }
      }
      if (shotTimer >0) {
        shotTimer --;
      } else {
        shotTimer = 0;
      }
    }
  }
  void shoot() {
    shots.add(new Shot(location.x, location.y, -10));
    soundShoot.play();
    soundShoot.rewind();
  }
}