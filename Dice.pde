void setup() {
  size(800, 800);
  frameRate(30);
}
int rotation = 1;
int randomRoll = (int)(Math.random()*6+1);
int direction = (int)(Math.random()*2);
int randomR = (int)(Math.random()*255+80);
int randomG = (int)(Math.random()*200+60);
int randomB = (int)(Math.random()*255);
int playerRoll =  (int)(Math.random()*20+1);
int d6Total = 0;
int d20Total = 0;
void draw() {
  
  playerRoll =  (int)(Math.random()*20+1);
  if (direction == 1) {
    direction = -1;
  } else {
    direction = 1;
  }
  //rect(400,400, 100, 100);
  background(100, 100, 100);
  // translate to desired location, rotate, create, reverse rotate, reverse translate
  // translate == location of object, x and y of shape are half of the size
  int flip = (int)(Math.random()*190);
/*  translate(400, 550);
  rotate(direction*radians(flip+10+rotation));
  fill(randomR+60, randomG+50, randomB-40);

  Die20 player = new Die20(-22, -106, playerRoll);
  player.showValue();
  rotate(-direction*(radians(flip+10+rotation)));
  translate(-400, -550);
*/
  for (int y = 100; y <= 170; y+=70) {
    flip = (int)(Math.random()*190);
    for (int x = 100; x <=500; x+=100) {
      flip = (int)(Math.random()*150);
      int randomRotation = (int)(Math.random()*45);
      translate(x, y);
      rotate(direction*radians(flip+randomRotation)); // direction = cw or ccw, flip = dice is upside down or not randomRotation = random amount to rotate rotation = how many times the die has rotated
      fill( randomR, randomG, randomB);
      randomRoll = (int)(Math.random()*20+1);
      //Die20 Rizz = new Die20(-22, -106, randomRoll);
      Die6 mini = new Die6(0, 0, (int)(Math.random()*5+1));
      mini.show();
      
      //Rizz.showValue();
      rotate(-direction*(radians(flip+randomRotation)));
      translate(-x, -y);
      if (rotation > 145) {
        d6Total = d6Total + mini.value;
      }
    }
  }
    flip = (int)(Math.random()*190);
    for (int x = 100; x <= 650; x+=250) {
      flip = (int)(Math.random()*190);
      int randomRotation = (int)(Math.random()*45);
      translate(x, 500);
      rotate(direction*radians(flip+randomRotation+rotation)); //do not question the 9000 different random variables
      fill(randomR+60, randomG+50, randomB-40);
      randomRoll = (int)(Math.random()*20+1);
      Die20 Rizz = new Die20(-22, -106, randomRoll);
      Rizz.showValue();
      rotate(-direction*(radians(flip+randomRotation+rotation)));

      translate(-x, -500);
      if (rotation > 145) {
        d20Total = d20Total + Rizz.value;
      }
    }
  


  /*template
   translate(200, 200);
   rotate(radians(45+rotation));
   //rect(-25, -25, 50, 50);
   rotate(-(radians(45+rotation)));
   
   translate(-200, -200);
   
   translate(100, 100);
   rotate(direction*(radians(191+rotation)));
   //rect(-25,-25,50,50);
   fill(222, 81, 135);
   Die Rizz = new Die(-22, -106, randomRoll);
   */

  rotation+=5;
  if (rotation > 150) {
    //System.out.println(rotation);
    noLoop();
    //System.out.println("6 Sided Dice total: " + d6Total );
    text("6 Sided Dice total: " + d6Total, 560,200);
    text("20 Sided Dice total: " + d20Total, 560, 300);
    if(d20Total > d6Total){
      text("20 Sided Dice win!",300,300);
    }else if(d6Total > d20Total){
      text("6 Sided Dice win!",300,300);
    }else{
      text("Tie between both dice!",300,300);
    }
  }
}

void mousePressed() {
  d6Total = 0;
  d20Total = 0;
  rotation = 1;
  randomRoll = (int)(Math.random()*6+1);
  direction = (int)(Math.random()*2);
  randomR = (int)(Math.random()*255+80);
  randomG = (int)(Math.random()*200+60);
  randomB = (int)(Math.random()*255);
  playerRoll =  (int)(Math.random()*20+1);
  loop();
}
class Die6 //models one single dice cube
{
  //member variable declarations here
  int value; 
  int myX, myY; 

  Die6(int x, int y, int num) //constructor
  {
    //162,108
    // 627,108
    //162,597
    //627,597

    //variable initializations here
    myX = x;
    myY = y;
    value = num;
    roll(); 
    show();
  }
  void roll()
  {
    //your code here
    // value = (int)(Math.random()*6+1);
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

class Die20 //models one single dice cube
{
  //member variable declarations here
  int value; 
  int myX, myY; 

  Die20(int x, int y, int num) //constructor
  {
    //162,108
    // 627,108
    //162,597
    //627,597

    //variable initializations here
    myX = x;
    myY = y;
    value = num;

    show();
  }
  void showValue()
  {
    //your code here
    // value = (int)(Math.random()*6+1);
    fill(0);
    textSize(20);
    if (value==6 || value == 9) {
      text(value+".", myX-5, myY+105);
    } else {
      text(value, myX-5, myY+105);
    }
  }
  void show()
  {
    // ATM this is just for a set position, subtract 425 from all x and y values to get a dice that appears at 0,0 and then add myX and myY values
    //back part of dice

    beginShape();
    // below is bruh
    vertex(myX, myY);
    vertex(286-197+myX, 91-43+myY);
    vertex(289-197+myX, 206-43+myY);
    vertex(204-197+myX, 255-43+myY);
    vertex(108-197+myX, 207-43+myY);
    vertex(108-197+myX, 99-43+myY);
    vertex(196-197+myX, 44-43+myY);
    vertex(203-197+myX, 86-43+myY);
    vertex(108-197+myX, 99-43+myY);
    vertex(203-197+myX, 86-43+myY);
    vertex(286-197+myX, 91-43+myY);
    vertex(262-197+myX, 177-43+myY);
    vertex(286-197+myX, 206-43+myY);
    vertex(262-197+myX, 177-43+myY);
    vertex(203-197+myX, 86-43+myY);
    vertex(148-197+myX, 179-43+myY);
    vertex(262-197+myX, 177-43+myY);
    vertex(204-197+myX, 255-43+myY);
    vertex(148-197+myX, 179-43+myY);
    vertex(108-197+myX, 99-43+myY);
    vertex(149-197+myX, 178-43+myY);
    vertex(108-197+myX, 205-43+myY);
    endShape();


    /*if(value == 20){
     text("2",myX-55,myY+85);
     text("14",myX+45,myY+85);
     text("18",myX-35,myY+40);
     text("4",myX+25,myY+40);
     text("8",myX,myY+175);
     text("12",myX-87,myY+125);
     text("10",myX-70,myY+170);
     text("16",myX+45,myY+175);
     text("6.",myX+72,myY+125);
     
     }*/


    //System.out.println(value);
  }
}
