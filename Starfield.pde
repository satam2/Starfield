Particle[] weee = new Particle[1000];
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
  double myAngle, mySpeed, myX, myY, mySize;
  Particle(){ // default constructor
    myAngle = (double)(Math.random()*2*Math.PI);
    mySpeed = (double)(Math.random()*15);
    myX = 250.0;
    myY = 250.0;
    mySize = 0.5;
  }
  void show(){
    fill(255);
    ellipse((float)myX,(float)myY,(float)mySize,(float)mySize);
  }
  void move(){
    myX += Math.cos(myAngle)*mySpeed;
    myY += Math.sin(myAngle)*mySpeed; 
    mySize += 0.005;
  }
}

class Oddball extends Particle{
  Oddball(){
    myAngle = (double)(Math.random()*2*Math.PI);
    mySpeed = (double)(Math.random()*10);
    myX = 250.0;
    myY = 250.0;
    mySize = 0.0;
  }
}
