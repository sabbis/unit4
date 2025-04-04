// Modes -----
boolean brush = true; //works
boolean lined = false; //works
boolean rectangle = false;
boolean stamp = false; //works

boolean drawingLine = false;
boolean drawingRect = false;
int startX, startY;
float currentColorR, currentColorG, currentColorB;

// Colors
color currentColor = 200;
float currentSize = 1;

// Slider
float posx = 30;
float posyR = 780;
float posyG = 780;
float posyB = 780;

void setup()
{
  size(1400, 800);
  background(255);
}

void draw()
{  
  currentColor = color(int(currentColorR), int(currentColorG), int(currentColorB));
  
  // Draw the UI layout
  layout();
  
  stroke(0);
  strokeWeight(2);
  fill(currentColor);
  rect(115, 750, 40, 40, 5);
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
  rect(-4, 550, 110, 800, 10);  
  fill(120);
  rect(115, 685, 70, 32, 5);
  rect(115, 643, 70, 32, 5);
  rect(115, 601, 70, 32, 5);//
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
  //Texts
  textSize(20);
  textAlign(CENTER, CENTER);
  fill(70);
  text("DRAW", 60, 120);
  text("LINE", 140, 120);
  text("STAMP", 60, 200);
  text("RECT", 140, 200);
  textSize(30);
  text("SIZE", 100, 380);
  textSize(25);
  text("COLOR", 50, 575);
  text("CLEAR", 150, 700);
  text("SAVE", 150, 658);
  text("LOAD", 150, 617);
  
  // Size Slider
  stroke(80);
  line(30, 420, 170, 420);
  noStroke();
  fill(200);
  circle(posx, 420, 20);
  
  //Red Slider
  stroke(80);
  line(20, 600, 20, 780);
  noStroke();
  fill(200);
  circle(20, posyR, 20);
  
  //Green Slider
  stroke(80);
  line(50, 600, 50, 780);
  noStroke();
  fill(200);
  circle(50, posyG, 20);
  
  //Blue Slider
  stroke(80);
  line(80, 600, 80, 780);
  noStroke();
  fill(200);
  circle(80, posyB, 20);
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
    if(mouseX > 10 && mouseX < 30 && mouseY > 595 && mouseY < 785)
    {
      posyR = mouseY;
    }
    if(mouseX > 40 && mouseX < 60 && mouseY > 595 && mouseY < 785)
    {
      posyG = mouseY;
    }
    if(mouseX > 70 && mouseX < 90 && mouseY > 595 && mouseY < 785)
    {
      posyB = mouseY;
    }
    currentSize = map(posx, 30, 170, 1, 90);
    currentColorR = map(posyR, 785, 595, 0, 255);
    currentColorG = map(posyG, 785, 595, 0, 255);
    currentColorB = map(posyB, 785, 595, 0, 255);
  } 
  else 
  {
    if (brush)
    {
      paint();
    }
    if (stamp) 
    {
      stampDraw(mouseX, mouseY);
    }
  }
}

void mousePressed() 
{
  if (mouseX > 0 && mouseX < 100 && mouseY > 80 && mouseY < 160) 
  {
    clearAllTools();
    brush = true;
  }
  else if (mouseX > 0 && mouseX < 100 && mouseY > 160 && mouseY < 240) 
  {
    clearAllTools();
    stamp = true;
  }
  else if (mouseX > 100 && mouseX < 180 && mouseY > 80 && mouseY < 160) 
  {
    clearAllTools();
    lined = true;
  }
  else if (mouseX > 100 && mouseX < 180 && mouseY > 160 && mouseY < 240) 
  {
    clearAllTools();
    rectangle = true;
  }
  else if (mouseX > 115 && mouseX < 185 && mouseY > 685 && mouseY < 717) 
  {
    Clear();
  }
  else if (mouseX > 115 && mouseX < 185 && mouseY > 643 && mouseY < 675) 
  {
    selectOutput("Save an image", "saveImage");
  }
  else if (mouseX > 115 && mouseX < 185 && mouseY > 601 && mouseY < 633) 
  {
    selectOutput("Load an image", "openImage");
  }
  
  if (mouseX > 197) 
  { 
    if (lined) 
    {
      startX = mouseX;
      startY = mouseY;
      drawingLine = true;
    }
    else if (rectangle) 
    {
      startX = mouseX;
      startY = mouseY;
      drawingRect = true;
    }
    else if (stamp) 
    {
      stampDraw(mouseX, mouseY);
    }
  }
}

void mouseReleased() 
{
  if (drawingLine) 
  {
    strokeWeight(currentSize);
    stroke(currentColor);
    line(startX, startY, mouseX, mouseY);
    drawingLine = false;
  }
  if (drawingRect) 
  {
    strokeWeight(currentSize);
    stroke(currentColor);
    int sizeX = mouseX-startX;
    int sizeY = mouseY-startY;
    rect(startX, startY, sizeX, sizeY);
    drawingRect = false;
  }
}

void paint()
{  
  strokeWeight(currentSize);
  stroke(currentColor);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void stampDraw(int x, int y) {
  noStroke();  
  // House
  fill(180, 100, 50);
  rect(x - currentSize * 10, y - currentSize * 7, currentSize * 20, currentSize * 14);  
  // Roof
  fill(150, 50, 30);
  triangle(x - currentSize * 10, y - currentSize * 7, x + currentSize * 10, y - currentSize * 7, x, y - currentSize * 14); 
  // Door
  fill(100, 50, 20);
  rect(x - currentSize * 2, y + currentSize * 3, currentSize * 4, currentSize * 6);
  
  // Windows
  fill(100, 150, 255);
  rect(x - currentSize * 6, y - currentSize, currentSize * 4, currentSize * 4); // Left window
  rect(x + currentSize * 2, y - currentSize, currentSize * 4, currentSize * 4); // Right window  
}

void clearAllTools()
{
  brush = false; //works
  lined = false; //works
  rectangle = false;
  stamp = false; //works
}

void Clear()
{
  noStroke();
  fill(255);
  rect(0,0,1400,800);
}

void saveImage(File f) 
{
    if (f != null) 
    {
        PImage canvas = get(200, 1, width, height);
        canvas.save(f.getAbsolutePath());
    }
}

void openImage(File f) 
{
    if (f != null) 
    {
        int n = 0;
        while (n < 100) 
        {
            PImage pic = loadImage(f.getPath());
            image(pic, 200, 0);
            n = n + 1;
        }
    }
}
