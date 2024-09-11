//This script only draws a few objects to the screen.
//Lesson 1, Made by: Ryan de Fost

int increasedAngle = 1;
int distance = 50;

int rectStartX = 0;
int rectStartY = 0;

PVector mixedStart = new PVector(200, 200); 
PVector overlappingRectStart = new PVector (300, 300);
PVector circleStart = new PVector (500, 225);

void setup() {
  size(1000, 500);
  background(#9fecf9);
  
  //Rectangle blocks.
  fill(#f9a30e);
  int offsetValue = 0;
  for (int i = 0; i < 3; i++){
    int currentX = rectStartX + offsetValue;
    int currentY = rectStartY + offsetValue;
    
    rect(currentX, currentY, 50, 50);
    
    offsetValue += 50;
  }
  
  //Mixed blocks and circle.
  fill(#0ef99b);
  circle(mixedStart.x, mixedStart.y, 50);
  square(mixedStart.x + 25, mixedStart.y - 25, 50);
  circle(mixedStart.x + 100, mixedStart.y, 50);

  //overlapping rectangles.
  fill(#490ef9);
  rect(overlappingRectStart.x, overlappingRectStart.y, 50, 50);
  rect(overlappingRectStart.x + 20, overlappingRectStart.y, 100, 50);

  //Connected circles. // circleStart
  fill(#f90e55);
  
  DrawCircleFromAngle(0, 0, circleStart, 50, 0);  
  DrawCircleFromAngle(distance, 90, circleStart, 50, 80);
  DrawCircleFromAngle(distance, -90, circleStart, 50, -90);
  DrawCircleFromAngle(distance, 210, circleStart, 50, 100);
  
  draw();
}

void draw()
{
  background(#9fecf9);
  
  fill(#f4900c);
  DrawCircleFromAngle(0, 0, circleStart, 50, 0);
  
  fill(#0cb6f4);
  DrawCircleFromAngle(100, 90 + increasedAngle * 0.5, circleStart, 50, 80);
  
  fill(#00c409);
  DrawCircleFromAngle(70, -90 + increasedAngle, circleStart, 50, -90);
  
  fill(#5500c4);
  DrawCircleFromAngle(175, 210 + increasedAngle * 1.3, circleStart, 50, 100);
  
  
  increasedAngle += 1;
}


//Draws a new circle based on the given position and angle.
void DrawCircleFromAngle(float distance, float angle, PVector startPosition, int size, int sizeMultiplier){
  float increasedSize = CircleSizeIncreaseArea(size/2, sizeMultiplier);
  distance = DistanceCorrectionBySize(distance, size/2, increasedSize);
  
  float x = distance * cos(radians(angle));
  float y = distance * sin(radians(angle));
  PVector circlePosition = new PVector (startPosition.x + x, startPosition.y + y);
  
  circle(circlePosition.x, circlePosition.y, increasedSize * 2);
}

float CircleSizeIncreaseArea(float radius, int percentage){
  float initialArea = PI * sq(radius);
  float increasedArea = initialArea * (1 + percentage / 100.0);
  float increasedRadius = sqrt(increasedArea / PI);
  
  return increasedRadius;
}

float DistanceCorrectionBySize(float distance, float originalRadius, float increasedRadius){
  float correctedDistance = 0;
  
  if(distance != 0){
      correctedDistance = (distance - originalRadius) + increasedRadius;
  }
  
  return correctedDistance;
}
