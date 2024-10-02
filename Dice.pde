void setup()
{
  noLoop();
  size(800, 800);
}
boolean allSix = false;
void draw()
{
  if(keyPressed && key == 'p'){
    allSix = true;
  }else{
    allSix = false;
  }
  fill(255);
  background(200,200,200);
  rect(311,626,148,60);
  //testing code for one dice at a set spot
  /* Die joemomma = new Die(400, 400);
   joemomma.roll();
   joemomma.show();
   System.out.println(joemomma.value);
   */
  int sum = 0;
  boolean shift = false;
  for (int y = 70; y <= 600; y+= 60)
  {
    if (shift == true) {
      for (int x = 110; x <= 700; x+=70)
      {
        Die Skibidi = new Die(x+(int)(Math.random()*40+15), y+(int)(Math.random()*40));
        Skibidi.roll();
        Skibidi.show();
        sum = sum + Skibidi.value;
      }
      shift = false;
    } else {
      for (int x = 100; x <= 700; x+=100)
      {
        Die Skibidi = new Die(x+(int)(Math.random()*45), y+(int)(Math.random()*45));
        Skibidi.roll();
        Skibidi.show();
        sum = sum + Skibidi.value;
      }
      shift = true;
    }
  }
  //System.out.println(sum);
  text("Sum of dice: " + sum, 330, 650);
}
void mousePressed()
{
  
  redraw();
  //System.out.println(mouseX + ", " +mouseY);
  
  
}



class Die //models one single dice cube
{
  //member variable declarations here
  int value; 
  int myX, myY; 

  Die(int x, int y) //constructor
  {
    //162,108
    // 627,108
    //162,597
    //627,597
    
    //variable initializations here
    myX = x;
    myY = y;
    roll(); 
    show();
  }
  void roll()
  {
    //your code here
    value = (int)(Math.random()*6+1);
    if(allSix == true) value = 6;
  }
  void show()
  {
    // ATM this is just for a set position, subtract 425 from all x and y values to get a dice that appears at 0,0 and then add myX and myY values
    //back part of dice
    fill(255); 
    rect(-25+myX, -25+myY, 50, 50, 15, 15, 15, 15); 
    //your code here
    fill(0); 
    if (value == 1) {
      ellipse(myX, myY, 9, 9);
    }
    if (value == 2) {
      ellipse(-12+myX, -13+myY, 9, 9); 
      ellipse(12+myX, 13+myY, 9, 9);
    }
    if (value == 3) {
      ellipse(-12+myX, -13+myY, 9, 9); 
      ellipse(myX, myY, 9, 9); 
      ellipse(12+myX, 13+myY, 9, 9);
    }
    if (value == 4) {
      ellipse(-12+myX, -13+myY, 9, 9); // left
      ellipse(12+myX, -13+myY, 9, 9); // right
      ellipse(-12+myX, 13+myY, 9, 9); //left
      ellipse(12+myX, 13+myY, 9, 9); //right
    }
    if (value == 5) {
      ellipse(-12+myX, -13+myY, 9, 9); // left
      ellipse(12+myX, -13+myY, 9, 9); // right
      ellipse(-12+myX, 13+myY, 9, 9); //left
      ellipse(12+myX, 13+myY, 9, 9); //right
      ellipse(myX, myY, 9, 9);
    }

    // example positions (besides center dot)

    if (value == 6) {
      //top
      ellipse(-12+myX, -13+myY, 9, 9); // left
      ellipse(12+myX, -13+myY, 9, 9); // right

      // middle
      ellipse(-12+myX, myY, 9, 9); // left
      ellipse(12+myX, myY, 9, 9); // right

      // bottom
      ellipse(-12+myX, 13+myY, 9, 9); //left
      ellipse(12+myX, 13+myY, 9, 9); //right
    }
  }
}
