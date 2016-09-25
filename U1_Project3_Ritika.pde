/*
Goals:
1. Declare and set up the array of circles
2. Add random movement
3. Add if it hits the wall, make it bounce off
4. Let me determine the speed
5. Remove random movement, and I get to control direction
6. Let me do size
*/

float circleX [];
float circleY [];
float xDirection [];
float yDirection [];
float x = 40;
float y = 40;

void setup ()
{
  fullScreen ();
  
  circleX = new float[100];
  circleY = new float[100];
  xDirection = new float[100];
  yDirection = new float[100];
  
  for(int i = 0; i < 100; i++)
  {
    circleX [i] = (int)random(0,width);
    circleY [i] = (int)random(0,height);
    xDirection [i] = random(10);
    yDirection [i] = random(10);
  }
 
}

void draw ()
{
  background (0);
  keyPressed ();

  for(int i=0; i < 100; i++)
  {
    fill (random (255));
    //fill(50,50,random(255));
    ellipse(circleX[i], circleY[i], x, y);
  
    circleX[i] = xDirection[i] + circleX[i];
    circleY[i] = circleY[i] + yDirection[i];
   
    if(circleX[i] > width)
    {
      xDirection [i] = xDirection [i] * -1;
    }
    
    if(circleX[i] < 0)
    {
      xDirection [i] = xDirection [i] * -1;
    }

    if(circleY[i] > height)
    {
      yDirection [i] = yDirection [i] * -1;
    }
    
    if(circleY[i] < 0)
    {
      yDirection [i] = yDirection [i] * -1;
    }
  }
}

void keyPressed ()
{
  for(int i=0; i < 100; i++)
  {
    if (key == 'a')
    {
      xDirection [i] = xDirection [i] -10;
    }
    
    if (key == 's')
    {
      yDirection [i] = yDirection [i] +5;
    }    
  }
}