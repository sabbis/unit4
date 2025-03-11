// Modes -----
boolean brush = false; //works
boolean lined = false; //works
boolean circle = false;
boolean rectangle = false;
boolean stamp = true; //works
boolean getColor = false;

boolean drawingLine = false;
int startX, startY;

// Colors
color currentColor = 200;
float currentSize = 1;

// Slider
float posx = 30;

void setup()
{
  size(1400, 800);
  background(255);
}

void draw()
{
  stroke(0);
  strokeWeight(2);
  fill(currentColor);
  rect(115, 750, 40, 40, 5);
  
  // Draw the UI layout
  layout();
}

void layout()
{
  noStroke();
  fill(170);
  rect(-4, 0, 200, 810, 10);
  fill(120);
  rect(-4, 0, 200, 500, 10);
  fill(110);
  rect(-4, 740, 175, 800, 10);
  fill(120);
  rect(-4, 550, 100, 800, 10);  
  stroke(110);
  strokeWeight(6);
  // Big line
  line(100, 20, 100, 320);
  // Small lines
  line(85, 20, 115, 20);
  line(85, 320, 115, 320);
  // Lines
  line(20, 80, 180, 80);
  line(20, 160, 180, 160);
  line(20, 240, 180, 240);
  
  // Size Slider
  stroke(80);
  line(30, 420, 170, 420);
  noStroke();
  fill(200);
  circle(posx, 420, 20);
}

void mouseDragged()
{
  if (mouseX < 197)
  {
    // Check if mouse is inside the slider range
    if(mouseX > 30 && mouseX < 170 && mouseY > 410 && mouseY < 430)
    {
      posx = mouseX;
    }
    currentSize = map(posx, 30, 170, 1, 90);
  } 
  else 
  {
    if (brush)
    {
      paint();
    }
    if (stamp) {
      stampDraw(mouseX, mouseY);
    }
  }
}

void mousePressed() {
  if (mouseX > 197) { 
    if (lined) {
      startX = mouseX;
      startY = mouseY;
      drawingLine = true;
    }
    if (stamp) {
      stampDraw(mouseX, mouseY);
    }
  }
}

void mouseReleased() {
  if (drawingLine) {
    strokeWeight(currentSize);
    stroke(currentColor);
    line(startX, startY, mouseX, mouseY);
    drawingLine = false;
  }
}

void paint()
{  
  strokeWeight(currentSize);
  stroke(currentColor);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void stampDraw(int x, int y)
{
  noStroke();
  float houseWidth = currentSize*5;
  float houseHeight = currentSize*3.3;
  float roofHeight = currentSize*2.5;
  float doorWidth = currentSize*0.4;
  float doorHeight = currentSize*1;
  float windowSize = currentSize*1;
  
  fill(180, 100, 50); 
  rect(x - houseWidth / 2, y - houseHeight / 2, houseWidth, houseHeight);
  
  fill(150, 50, 30);
  triangle(x - houseWidth / 2, y - houseHeight / 2, 
           x + houseWidth / 2, y - houseHeight / 2, 
           x, y - houseHeight / 2 - roofHeight);

  fill(100, 50, 20);
  rect(x - doorWidth / 2, y + houseHeight / 2 - doorHeight, doorWidth, doorHeight);
  
  
  fill(100, 150, 255); 
  rect(x - houseWidth / 3 - windowSize / 2, y - houseHeight / 3, windowSize, windowSize);
  rect(x + houseWidth / 3 - windowSize / 2, y - houseHeight / 3, windowSize, windowSize);

  line(x - houseWidth / 3, y - houseHeight / 3, x - houseWidth / 3, y - houseHeight / 3 + windowSize);
  line(x - houseWidth / 3 - windowSize / 2, y - houseHeight / 3 + windowSize / 2, x - houseWidth / 3 + windowSize / 2, y - houseHeight / 3 + windowSize / 2);
  
  line(x + houseWidth / 3, y - houseHeight / 3, x + houseWidth / 3, y - houseHeight / 3 + windowSize);
  line(x + houseWidth / 3 - windowSize / 2, y - houseHeight / 3 + windowSize / 2, x + houseWidth / 3 + windowSize / 2, y - houseHeight / 3 + windowSize / 2);
}
