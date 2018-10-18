Particle[] stars;
void setup()
{
  size(600, 600);
  background(250, 250, 250);
  stars = new Particle[500];
  frameRate(60);
  for(int i = 2; i < stars.length; i++) {
    stars[i] = new NormalParticle();
  }
  stars[0] = new OddballParticle();
  stars[1] = new JumboParticle();
}
void mousePressed(){
  for(int i = 2; i < stars.length; i++) {
    stars[i] = new NormalParticle();
  }
  stars[0] = new OddballParticle();
  stars[1] = new JumboParticle();
}

void draw()
{
  background(250, 250, 250);
  for(int i = 0; i < stars.length; i++) {
    stars[i].move();
    stars[i].show();
  }
}
public class NormalParticle implements Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColorR, myColorG, myColorB;
  NormalParticle(){
    myAngle = Math.random() * TWO_PI;
    mySpeed = Math.random() * 10;
    myX = mouseX;
    myY = mouseY;
    myColorR = (int) (Math.random() * 255);
    myColorG = (int) (Math.random() * 255);
    myColorB = (int) (Math.random() * 255);
  }
  public void move(){
    myX = (Math.cos(myAngle) * mySpeed) + myX;
    myY = (Math.sin(myAngle) * mySpeed) + myY;
  }
  public void show(){
    ellipse((float)myX, (float)myY, 10, 10);
    fill(myColorR, myColorG, myColorB);
  }
}
public interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle 
{
  int myX, myY;
  OddballParticle(){
    myX = mouseX;
    myY = mouseY;
  }
   public void show(){
    ellipse(myX, myY, 20, 20);
    fill((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
  }
   public void move(){
    myX+= (int) (Math.random() * 10) - 5;
    myY+= (int) (Math.random() * 10) - 5;
  }
}
class JumboParticle extends NormalParticle
{
  public void show(){
    ellipse((float)myX, (float)myY, 50, 50);
    fill((int)(Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
  }
}
