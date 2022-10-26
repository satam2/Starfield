Particle[] weee = new Particle[200];
void setup(){
  size(500,500);
  noStroke();
  for(int i = 0; i< weee.length; i++)
    weee[i] = new Particle();
}

void draw(){
  background(0);
  for(int i = 0; i< weee.length; i++){
    weee[i].show();
    weee[i].move();
  }
}

class Particle{
  double myAngle, mySpeed, myX, myY;
  Particle(){ // default constructor
    myAngle = (double)(Math.random()*2*Math.PI);
    mySpeed = (double)(Math.random()*10);
    myX = 250.0;
    myY = 250.0;
  }
  void show(){
    fill(255,0,0);
    ellipse((float)myX,(float)myY,10,10);
  }
  
  void move(){
    myX += Math.cos(myAngle)*mySpeed;
    myY += Math.sin(myAngle)*mySpeed; 
  }
}

class OddBall extends Particle{
  
}
