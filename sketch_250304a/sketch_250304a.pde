color red = #F20000;

float sliderX;
float sizeR;

void setup() 
{
    size(800, 600);
    strokeWeight(5);
    stroke(red);
    fill(red);
    sliderX = 400;
    controlSlider();
}

void draw() 
{
    background(0);
    line(100, 300, 700, 300);
    circle(sliderX, 300, 50);
    rect(100, 100, 1*sizeR, 100);
}

void mouseReleased() 
{
    controlSlider();
  
}

void mouseDragged()
{
  controlSlider();
}

void controlSlider()
{
  if(mouseX > 100 && mouseX < 700 && mouseY > 275 && mouseY <325)
    {
      sliderX = mouseX;
    }
    sizeR = map(sliderX, 100, 700, 0, 600);
}
