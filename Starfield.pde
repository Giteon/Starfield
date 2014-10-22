boolean reset = true;
int numParticles = 2000;
boolean lightSpeed = false;
int count = 0;
 // NormalParticle[aBunch] = new NormalParticle[NUM_PARTS];
 Particle[] aBunch;
 void setup()
 {
 	size(900, 900);

 	background(0);

 	aBunch = new Particle[numParticles];

 	for (int i=0; i<numParticles; i++)
 	{

 		aBunch[i] = new NormalParticle();
 		aBunch[1] = new JumboParticle();
 	}
 }
 void draw()   
 {   
 	count = (int)(frameCount/100);
 	if(lightSpeed == false)
 	{
//     if(Math.random()<0.05)
//     {
	background(0);
//   }
}
for (int g=0; g<numParticles; g++) 

{
	aBunch[g].move();
	aBunch[g].show();
}

}

class NormalParticle implements Particle
{
	double myX;
	double myY;
	double myAngle;
	double mySpeed;
int mySize;
	int myColor;


	NormalParticle()
	{
	if(reset == true)
	{
			myX = width/2;
			myY = height/2;
			mySpeed = Math.random()*2.2+0.4;
			myAngle = Math.PI*2*Math.random();
			myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
			mySize = 5;
		}
	}



	public void show()
	{
		if(reset == true)
		{
			myX = width/2;
			myY = height/2;
			mySpeed = Math.random()*2.2+0.4;
			myAngle = Math.PI*2*Math.random();
			myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
			reset = false;
		}
		int randSize = (int)(Math.random()*3);
		stroke(myColor);
		fill(myColor);
		noFill();
		ellipse((float)myX,(float)myY,mySize+randSize,mySize+randSize);
		// if (myX > width)
		// {
		// 	reset = true;
		// }
		// if (myY > height)
		// {
		// 	reset = true;
		// }
	}
	public void move()
	{

		if(lightSpeed ==false)
		{
			myX = (Math.sin(myAngle)*mySpeed)+myX;
			myY = (Math.cos(myAngle)*mySpeed)+myY;
			if(mySpeed > 4)
			{
				mySpeed = 0.5;
			}
			mySpeed +=.1;
		}

		if(lightSpeed == true)
		{
			myX = (Math.sin(myAngle-mouseY)*mySpeed)+myX;
			myY = (Math.cos(myAngle+mouseX)*mySpeed)+myY;
			if(mySpeed < -4)
			{
				mySpeed = 0.5;
			}
			mySpeed -=.1;
		}
if(keyPressed == true)
{

	if(key == ' ')
	{
	lightSpeed = false;
//    myX = width/(Math.random()+1.5);
//    myY = height/(Math.random()+1.5);
reset = true;
}
}
}
}




class OddballParticle implements Particle
{
	double myX;
	double myY;
	double myAngle;
	double mySpeed;

	int myColor;
	OddballParticle()
	{
		if(reset == true)
		{
			myX = width/2;
			myY = height/2;
			mySpeed = Math.random()*2.2+0.4;
			myAngle = Math.PI*2*Math.random();
			myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		}
	}
	public void move() {

		if(lightSpeed ==false)
		{
			myX = (Math.cos(myAngle)*mySpeed)+myX;
			myY = (Math.sin(myAngle)*mySpeed)+myY;
			if(mySpeed > 4)
			{
				mySpeed = 0.5;
			}
			mySpeed +=.1;
		}

		if(lightSpeed == true)
		{
			myX = (Math.cos(myAngle-mouseY)*mySpeed)+myX;
			myY = (Math.sin(myAngle+mouseX)*mySpeed)+myY;
			if(mySpeed < -4)
			{
				mySpeed = 0.5;
			}
			mySpeed -=.1;
		}
//  if(frameCount%400==0)
if(keyPressed == true)
{
	if(key == ' ')
	{
		lightSpeed = false;
//    myX = width/(Math.random()+1.5);
//    myY = height/(Math.random()+1.5);
reset = true;
}

}
}
public void show(){
	int randSize = (int)(Math.random()*3);
	stroke(myColor,100);
	fill(myColor,100);
	// noFill();
	// rect((float)myX,(float)myY,20+randSize,20+randSize);
// 	if (myX > width)
// 	{
// 		reset = true;
// 	}
// 	if (myY > height)
// 	{
// 		reset = true;
// 	}
 }
}
class JumboParticle extends NormalParticle{

JumboParticle(){
//mySize = 200;

}

}
interface Particle
{
	public void move();
	public void show();
}


void mouseClicked()
{
	lightSpeed = !lightSpeed;
}
