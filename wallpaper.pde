float centerX;
float centerY;
float radius;
int strokeCol;
int strokeSat;
int strokeBright;
float radiusNoise;
float angNoise;
float xNoise;
float yNoise;
float dragStart;

void setup() {
  fullScreen();
  colorMode(HSB, 100);
  smooth();
  background(20);
  noFill();

  strokeCol = int(random(100));
  radiusNoise = 0;
  angNoise = 0;
  xNoise = 0;
  yNoise = 0;
}

void mousePressed() {
  dragStart = millis();
  centerX = mouseX;
  centerY = mouseY;

  strokeSat = int(random(80, 100));
  strokeBright = int(random(70, 100));

  for (float _angle = 0; _angle <= 360; _angle += 1) {
    radiusNoise += 0.005;
    radius = (noise(radiusNoise) * 750) + 1;
    angNoise += 0.005;
    _angle += (noise(angNoise) * 6) - 3;
    xNoise += 0.05;
    float thisCenterX = centerX + (noise(xNoise) * 100) - 50;
    yNoise += 0.05;
    float thisCenterY = centerY + (noise(yNoise) * 100) - 50;


    stroke(strokeCol, strokeSat, strokeBright, 50);
    float rad = radians(_angle);

    float x1 = thisCenterX + (cos(rad) * radius);
    float y1 = thisCenterY + (sin(rad) * radius);

    float opprad = rad + PI;
    float x2 = thisCenterX + (cos(opprad) * radius);
    float y2 = thisCenterY + (sin(opprad) * radius);

    line(x1, y1, x2, y2);
  }
  strokeCol -= 3;
  if (strokeCol < 0) {
    strokeCol+=100;
  }
}

void mouseDragged() {
  float dragTime = millis() - dragStart;
  if (dragTime > 300) {
    background(20);
    strokeCol = int(random(100));
  }
}

void draw() {
}
