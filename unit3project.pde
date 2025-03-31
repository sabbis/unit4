int randX;
int randY;
ArrayList<String> roadCords;
ArrayList<String> checkForRoad;
color grass = (#60AD1A);
  
void setup()
{
    roadCords = new ArrayList<String>();
    size(800, 600);
    background(#60AD1A);
    random();
    noStroke();
    
    while (randX <= width)
    {
      int randDist = int(random(100, 120));
      road(randX, 0, true); 
      
      randX += randDist;
    }
    
    while (randY <= height)
    {
      int randDist = int(random(70, 90));
      road(0, randY, false); 
      
      randY += randDist;
    }
    
    for (int y = 0; y < height; y += 80)
    {
      for (int x = 0; x < width; x += 110)
      {
        color checkRoad = get(x, y);
        if(checkRoad == grass)
        {
          drawHouse(x, y);
        }
        else 
        {
          x -= 109;
        }
      }
    }
}

void draw()
{
    
}

void random()
{    
    randX = int(random(1, 150));
    randY = int(random(1, 100));
}

void road(int xCord, int yCord, boolean vertical) 
{
  if (vertical)
  {
    for (int y = 0; y <= height; y++) 
    {
      fill(0); 
      rect(xCord, y, 11, 1); 
      
      fill(255);
      rect(xCord-2, y, 2, 1);
      rect(xCord + 11, y, 2, 1);
      
      roadCords.add(xCord + "," + y);
      
      if (y % 5 == 0)
      {
        fill(#FFF158); 
        rect(xCord + 5, y, 1, 1); 
      }
    }
  }
  else
  {
    for (int x = 0; x <= width; x++) 
    {
      fill(0); 
      rect(x, yCord, 1, 11);
      
      fill(255);
      rect(x, yCord-2, 1, 2);
      rect(x, yCord+11, 1, 2);
      
      if(roadCords.contains(x + "," + yCord))
      {
        
        noFill();
        strokeWeight(3);
        stroke(255);
        rect(x, yCord, 10, 11);
        x += 11;
        noStroke();
        
      }
      
      if (x % 5 == 0)
      {
        fill(#FFF158); 
        rect(x, yCord + 5, 1, 1); 
      }
      
      roadCords.add(x + "," + yCord);
    }
  }
}

void drawHouse(int houseX, int houseY) {
  
  
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
