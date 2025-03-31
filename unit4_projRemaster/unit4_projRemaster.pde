color grass = (#60AD1A);
int ycoordStart, ycoordSave, ycoord;


void setup()
{
  size(1000, 800);
  time(int(random(1, 5)));
  drawHill(int(random(200, 500)));
  trees();
  houses();
}

void time(int currentTime)
{
  print(currentTime);
  switch(currentTime)
  {
    case 1: background(#58C0FF); sun(1); break;
    case 2: background(#0285D3); stars(4); sun(2); break;
    case 3: background(#00588E); stars(4); sun(3); break;
    case 4: background(#013250); stars(1); sun(4); break;
  }
}

void sun(int caseT)
{
  switch(caseT)
  {
    case 1: fill(#FAEE08); circle(500, 70, 100); break;
    case 2: fill(#FAEE08); circle(800, 150, 100); fill(200); circle(100, 150, 100); break;
    case 3: fill(200); circle(100, 150, 100); fill(#FAEE08); circle(800, 150, 100); break;
    case 4: fill(200); circle(500, 70, 100); break;
  }
}

void drawHill(int hillY)
{
  ycoordStart = hillY;
  ycoordSave = hillY;
  noStroke();
  fill(grass);
  rect(0, hillY, 1000, 600);
  
}

void houses()
{
  ycoordStart = ycoordSave;
  while(ycoordStart < 800)
  {
    for(int x = 0; x < width; x+=10)
    {
      int r = int(random(1,10));
      if(r == 1)
      {
        drawHouse(x, ycoordStart);
        x += 50;
      }
    }
    ycoordStart+=50;
  }
}

void trees()
{
  ycoordStart = ycoordSave;
  while(ycoordStart < 800)
  {
    for(int x = 0; x < width; x+=3)
    {
      int r = int(random(1,6));
      if(r == 1)
      {
        drawTree(x, ycoordStart);
        x += 10;
      }
    }
    ycoordStart+=25;
  }
}

void stars(float amount)
{
  ycoord = 0;
  while(ycoord < 600)
  {
    for(int x = 0; x < width; x+=10*amount)
    {
      int r = int(random(1,7));
      if(r == 1)
      {
        drawStar(x, ycoord);
        x += 8*amount;
      }
    }
    ycoord+=20*amount;
  }
}

void drawHouse(int houseX, int houseY) 
{  
    // Random elements
    color roofColor = color(random(100, 255), random(50, 150), random(50, 150));
    color wallColor = color(random(180, 220), random(120, 170), random(80, 130));
    color doorColor = color(random(80, 130), random(40, 90), random(0, 50));
    color windowColor = color(0, 150, 255);
    int roofHeight = 10;
    
    fill(wallColor);
    rect(houseX, houseY, 40, 40);
    
    fill(roofColor);
    triangle(houseX, houseY, houseX + 40, houseY, houseX + 20, houseY - roofHeight);
    
    fill(doorColor);
    rect(houseX + 25, houseY + 22, 10, 15);
    fill(0);
    ellipse(houseX + 27, houseY + 32, 3, 3); // door knob
    
    fill(windowColor);
    rect(houseX + 5, houseY + 10, 10, 10);
    rect(houseX + 25, houseY + 10, 10, 10);
    
    stroke(0);
    line(houseX + 10, houseY + 10, houseX + 10, houseY + 20);
    line(houseX + 5, houseY + 15, houseX + 15, houseY + 15);
    line(houseX + 30, houseY + 10, houseX + 30, houseY + 20);
    line(houseX + 25, houseY + 15, houseX + 35, houseY + 15);
    
    noStroke();
  
}

void drawTree(int treeX, int treeY) 
{  
    //colors
    color trunkColor = color(random(80, 130), random(40, 90), random(0, 50));
    color leavesColor = color(random(30, 100), random(100, 200), random(30, 100));
    
    //trunk 
    fill(trunkColor);
    rect(treeX + 5, treeY + 10, 6, 10);
    
    //leaves 
    fill(leavesColor);
    ellipse(treeX + 8, treeY, 16, 12);
    ellipse(treeX, treeY + 2, 14, 10);
    ellipse(treeX + 16, treeY + 2, 14, 10);
}

void drawStar(int starX, int starY) 
{
    fill(255); // White color
    noStroke();
    
    // Draw cross-like star (center + four small arms)
    rect(starX + 3, starY, 2, 8); // Vertical line
    rect(starX, starY + 3, 8, 2); // Horizontal line
    
    // Optional: Add tiny diagonal dots for a sharper look
    rect(starX + 1, starY + 1, 2, 2);
    rect(starX + 5, starY + 1, 2, 2);
    rect(starX + 1, starY + 5, 2, 2);
    rect(starX + 5, starY + 5, 2, 2);
}
