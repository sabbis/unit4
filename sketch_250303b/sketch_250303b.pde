color lBrown = #B45F4E;
color mBrown = #7C3324;
color dBrown = #34120B;

void setup()
{
  size(400, 400);
  background(170, 255, 5);
}

void draw()
{
  strokeWeight(3);
  if(mouseX > 60 && mouseX < 110 && mouseY > 100 && mouseY < 150)
  {
    stroke(255);
    fill(lBrown);
    rect(60, 100, 50, 50);   
  } else {
    stroke(0);
    fill(lBrown);
    rect(60, 100, 50, 50); 
  }
  
  if(mouseX > 175 && mouseX < 225 && mouseY > 100 && mouseY < 150)
  {
    stroke(255);
    fill(mBrown);
    rect(175, 100, 50, 50); 
  } else {
    stroke(0);
    fill(mBrown);
    rect(175, 100, 50, 50); 
  }
  
  if(mouseX > 290 && mouseX < 340 && mouseY > 100 && mouseY < 150)
  {
    stroke(255);
    fill(dBrown);
    rect(290, 100, 50, 50); 
  } else {
    stroke(0);
    fill(dBrown);
    rect(290, 100, 50, 50); 
  }
  stroke(0);
  
}

void mouseReleased()
{
  if(mouseX > 60 && mouseX < 110 && mouseY > 100 && mouseY < 150)
  {
    lightBrown();
  }
  
  if(mouseX > 175 && mouseX < 225 && mouseY > 100 && mouseY < 150)
  {
    mediumBrown();
  }
  
  if(mouseX > 290 && mouseX < 340 && mouseY > 100 && mouseY < 150)
  {
    darkBrown();
  }
}

void lightBrown()
{
  fill(lBrown);
  rect(150, 200, 100, 100);
}

void mediumBrown()
{
  fill(mBrown);
  rect(150, 200, 100, 100);
}

void darkBrown()
{
  fill(dBrown);
  rect(150, 200, 100, 100);
}
