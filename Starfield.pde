Particle[] weee = new Particle[1000];
void setup(){
  size(500,500);
  noStroke();
  background(0);
  weee[0] = new Oddball();
  for(int i = 1; i< weee.length; i++){
    weee[i] = new Particle();
  }
}

void draw(){
  background(0);
 
  for(int i = 0; i< weee.length; i++){
    weee[i].show();
    weee[i].move();
    if(weee[i].mySize > 2){
      weee[i].myX = 250;
      weee[i].myY = 250;
      weee[i].mySize = 1;
      weee[i].myAngle = (double)(Math.random()*2*Math.PI);
      weee[i].mySpeed = (double)(Math.random()*10)+0.3; 
    } 
  }
}

class Particle{
  double myAngle, mySpeed, myX, myY, mySize;
  Particle(){ // default constructor
    myAngle = (double)(Math.random()*2*Math.PI);
    mySpeed = (double)(Math.random()*10+0.3);
    myX = 250.0;
    myY = 250.0;
    mySize = 1;
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
    mySpeed = (double)(Math.random()*5);
    myX = 250.0;
    myY = 250.0;
    mySize = 0.0;
  }
}
