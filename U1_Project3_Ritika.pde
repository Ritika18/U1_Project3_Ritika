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
float x = 40;
float y = 40;

void setup ()
{
  fullScreen ();
  
  circleX = new float[100];
  circleY = new float[100];
  
  for(int i = 0; i < 100; i++)
  {
    circleX [i] = (int)random(0,width);
    circleY [i] = (int)random(0,height);
  }
 
}

void draw ()
{
  background (0);

  for(int i=0; i < 100; i++)
  {
    fill (random (255));
    //fill(50,50,random(255));
    ellipse(circleX[i], circleY[i], x, y);
  }
}
  