//modes -----
boolean brush = true;
boolean line = false;
boolean circle = false;
boolean rectangle = false;
boolean stamp = false;
boolean getColor = false;

//colors
color currentColor = 255;

void setup()
{
  size(1400, 800);
  background(255);
  layout();
}

void draw()
{
  stroke(0);
  strokeWeight(2);
  fill(currentColor);
  rect(115, 750, 40, 40, 5);
}

void layout()
{
  noStroke();
  fill(120);
  rect(-4, 0, 200, 500, 10);
  fill(110);
  rect(-4, 740, 175, 800, 10);
  fill(120);
  rect(-4, 550, 100, 800, 10);  
  stroke(110);
  strokeWeight(6);
  //big line
  line(100, 20, 100, 320);
  //small lines
  line(85, 20, 115, 20);
  line(85, 320, 115, 320);
  //lines
  line(20, 80, 180, 80);
  line(20, 160, 180, 160);
  line(20, 240, 180, 240);
  
  //size Slider
  stroke(80);
  line(30, 420, 170, 420);
  noStroke();
  fill(200);
  ellipse(30, 420, 20, 20);
}



void paint()
{
  
}
