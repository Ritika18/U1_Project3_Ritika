/*
Name: Galaxy

How it works: This is designed as something to play around with, which looks open
and free like a galaxy, hence it's name. This uses multiple circles, where you can
control their direction and size. The direction is managed by the wasd keys. To 
increase the size of the circles, you press y and to decrease the size you press
u. Beyond that, you can just play around with the program. If by any chance the 
circles go off of the left or right side, you can bring them back by consistently
pressing the key which sends it in the other direction. 

*/

//creating arrays for the amount of circles
float circleX [];
float circleY [];
//creating arrays for the direction of the circles
float xDirection [];
float yDirection [];
//creating an array for the size of circles
float size = 20;

void setup ()
{
  //size of the screen
  fullScreen ();
  
  //Index
  circleX = new float[1000];
  circleY = new float[1000];
  xDirection = new float[1000];
  yDirection = new float[1000];
  
  //assigning the arrays a value in a for loop
  for(int i = 0; i < 100; i++)
  {
    //location
    circleX [i] = (int)random(0,width);
    circleY [i] = (int)random(0,height);
    //direction
    xDirection [i] = random(10);
    yDirection [i] = random(10);
  }

}

void draw ()
{
  //black background
  background (0);
  
  //for loop 
  for(int i=0; i < 1000; i++)
  {
    //color of the circles
    fill (random (255));
    //creating my circles
    ellipse(circleX[i], circleY[i], size, size);
    
    //giving all of my circles x and y directions
    circleX[i] = xDirection[i] + circleX[i];
    circleY[i] = circleY[i] + yDirection[i];
   
    //setting boundaries for if it goes off of the right side
    if(circleX[i] > width)
    {
      //let the circles go off the screen
      xDirection [i] = xDirection [i] * 1;
    }
    
    //setting boundaries for if it goes off of the left side
    if(circleX[i] < 0)
    {
      //let the circles go off the screen
      xDirection [i] = xDirection [i] * 1;
    }
    
    //setting boundaries for if it goes off of the bottom side
    if(circleY[i] > height)
    {
      //make it bounce upwards
      yDirection [i] = yDirection [i] * -1;
    }
    
    //setting boundaries for if it goes off of the top side
    if(circleY[i] < 0)
    {
      //make it bounce downwards
      yDirection [i] = yDirection [i] * -1;
    }
  }
  
  //what happens when keys are pressed
  if (keyPressed) 
  {
    //for loop
    for (int i = 0; i < 1000; i++)
    {
      //when a is pressed
      if (key == 'a')
      {
        //subtract 2 from the speed of the x direction
        xDirection [i] = xDirection [i] -2;
      }
      
      //when s is pressed
      if (key == 's')
      {
        //add 2 from the speed of the y direction
        yDirection [i] = yDirection [i] +2;
      } 
      
      //when d is pressed
      if (key == 'd')
      {
        //add 2 from the speed of the x direction
        xDirection [i] = xDirection [i] +2;
      }
      
      //when w is pressed
      if (key == 'w')
      {
        //subtract 2 from the speed of the y direction
        yDirection [i] = yDirection [i] -2;
      } 
    }
    
    //Increasing and decreasing the size
    //when y is pressed
    if (key == 'y')
    {
      //Increase the size
      size = size + 5;
    }
    
    //when u is pressed
    if (key =='u')
    {
      //if the size isn't greater than 10, then don't decrease the size anymore
      if (size-10 >= 10)
      {
        //if it is over 10, decrease the size by 5
        size = size - 5;
      }
    }
  }
}