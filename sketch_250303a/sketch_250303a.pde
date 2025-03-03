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
  stroke(0);
  fill(lBrown);
  ellipse(60, 100, 100, 100);
  fill(mBrown);
  ellipse(200, 100, 100, 100);
  fill(dBrown);
  ellipse(340, 100, 100, 100);
}

void mouseReleased()
{
  if(dist(60, 100, mouseX, mouseY) < 50)
  {
    lightBrown();
  }
  
  if(dist(200, 100, mouseX, mouseY) < 50)
  {
    mediumBrown();
  }
  
  if(dist(340, 100, mouseX, mouseY) < 50)
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
