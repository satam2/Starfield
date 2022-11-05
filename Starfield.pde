Particle[] weee = new Particle[1000];
void setup(){
  size(500,500);
  noStroke();
  background(0);
  for(int i = 0; i< 5; i++)
    weee[i] = new Oddball((int)(Math.random()*501),(int)(Math.random()*501));
  for(int i = 5; i< weee.length; i++)
    weee[i] = new Particle();
}

float rot = 0;

void draw(){
  background(0);
  for(int i = 0; i < 5; i++){ // aliens
    weee[i].show();
    weee[i].move();
    if(weee[i].myX > width-20)
      weee[i].myX = 480;
    if(weee[i].myY > height-30)
      weee[i].myY = 470;
    if(weee[i].myX < 20)
      weee[i].myX = 20;
    if(weee[i].myY < 10)
      weee[i].myY = 10;
  }
  
  pushMatrix();
  translate(250,250);
  rotate(rot);
  for(int i = 5; i< weee.length; i++){ // stars
    weee[i].move();
    weee[i].show();
    if(weee[i].mySize > 1.5){
      weee[i].myX = 0;
      weee[i].myY = 0;
      weee[i].mySize = 1;
      weee[i].myAngle = (double)(Math.random()*2*Math.PI);
      weee[i].mySpeed = (double)(Math.random()*10)+0.3; 
    } 
  } // end of stars loop
  rot += 0.05;
  popMatrix();
}

class Particle{
  double myAngle, mySpeed, myX, myY, mySize;
  Particle(){ // default constructor
    myAngle = (double)(Math.random()*2*Math.PI);
    mySpeed = (double)(Math.random()*5);
    myX = 0.0;
    myY = 0.0;
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
  int myColor;
  Oddball(int x, int y){
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256), (int)(Math.random()*256));
    myAngle = (double)(Math.random()*2*Math.PI);
    mySpeed = (double)(Math.random()*10+0.3);
    myX = x;
    myY = y;
    mySize = 1;
  }
  void show(){
    noStroke();
    fill(myColor);
    // alien
    arc((float)myX,(float)myY+15,30,30,radians(0),radians(180));
    triangle((float)myX-15,(float)myY+15,(float)myX+15,(float)myY+15,(float)myX,(float)myY-5);
    // white part of eye
    fill(255);
    ellipse((float)myX,(float)myY+5,5,10);
    ellipse((float)myX-5,(float)myY+15,5,10);
    ellipse((float)myX+5,(float)myY+15,5,10);
    // pupil
    fill(0);
    ellipse((float)myX,(float)myY+5,2,8);
    ellipse((float)myX-5,(float)myY+15,2,8);
    ellipse((float)myX+5,(float)myY+15,2,8);
    // smile :)
    noFill();
    stroke(0);
    arc((float)myX,(float)myY+22,5,5,radians(15),radians(165));
    // UFO bubble
    noStroke();
    fill(0,0,255,40);
    ellipse((float)myX,(float)myY+10,45,40);
    // UFO base
    fill(150);
    beginShape();
    vertex((float)myX-20,(float)myY+25);
    vertex((float)myX+20,(float)myY+25);
    vertex((float)myX+15,(float)myY+30);
    vertex((float)myX-15,(float)myY+30);
    endShape();
    // UFO lights
    fill(255,255,0); 
    ellipse((float)myX-16,(float)myY+27.5,3,3);
    ellipse((float)myX-8,(float)myY+27.5,3,3);
    ellipse((float)myX,(float)myY+27.5,3,3);
    ellipse((float)myX+8,(float)myY+27.5,3,3);
    ellipse((float)myX+16,(float)myY+27.5,3,3);
  }
  
  void move(){
    myX += (int)(Math.random()*3)-1; 
    myY += (int)(Math.random()*3)-1;
  }
}
