/*
Goals:
1. Declare and set up the array of circles
2. Add random movement
3. Add if it hits the wall, make it bounce off
4. I get to control direction
6. Let me do size
*/

float circleX [];
float circleY [];
float xDirection [];
float yDirection [];
float size = 20;

void setup ()
{
  fullScreen ();
  
  circleX = new float[1000];
  circleY = new float[1000];
  xDirection = new float[1000];
  yDirection = new float[1000];
  
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

  for(int i=0; i < 1000; i++)
  {
    fill (random (255));
    //fill(50,50,random(255));
    ellipse(circleX[i], circleY[i], size, size);
  
    circleX[i] = xDirection[i] + circleX[i];
    circleY[i] = circleY[i] + yDirection[i];
   
    if(circleX[i] > width)
    {
      xDirection [i] = xDirection [i] * 1;
    }
    
    if(circleX[i] < 0)
    {
      xDirection [i] = xDirection [i] * 1;
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

  if (keyPressed) 
  {
    for (int i = 0; i < 1000; i++)
    {
      if (key == 'a')
      {
        xDirection [i] = xDirection [i] -2;
      }
    
      if (key == 's')
      {
        yDirection [i] = yDirection [i] +2;
      } 
    
      if (key == 'd')
      {
        xDirection [i] = xDirection [i] +2;
      }
    
      if (key == 'w')
      {
        yDirection [i] = yDirection [i] -2;
      } 
    }
      
    if (key == 'y')
    {
      size = size + 5;
    }
   
    if (key =='u')
    {
      if (size-10 >= 10)
      {
        size = size - 5;
      }
    }
  }
}