// Rupert Russell
// 3 June 2018
// Draw a 10 Pointed star design
// Page 207 in Islamic Geometric design (big book) by Eric Broug
// includes Guidelines

//https://web.archive.org/web/20150523075408/http://www.thelck.com:80/patterns/tenPointStar.html


//float xCenter = 800;
//float yCenter = 800;

float xCenter = 300;
float yCenter = 300;


float scale = 500;

float[] outerX; // store xPoints for the 10 points on the outer circle
float[] outerY; // store yPoints for the 10 points on the outer circle

float[] innerX; // store xPoints for the 10 points on the outer circle
float[] innerY; // store yPoints for the 10 points on the outer circle

float[] innerMostX; // store xPoints for the 10 points on the outer circle
float[] innerMostY; // store yPoints for the 10 points on the outer circle


int fillCount = 0;
float innerMost = 0;
void setup() {
  // size(1600, 1600); // width x height
  size(600, 600); // width x height
  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);

  outerX = new float[10]; // store x Points for the 10 points on the outer circle
  outerY = new float[10]; // store y Points for the 10 points on the outer circle

  innerX = new float[360]; // store x Points for the 10 points on the outer circle
  innerY = new float[360]; // store y Points for the 10 points on the outer circle

  innerMostX = new float[360]; // store x Points for the 10 points on the outer circle
  innerMostY = new float[360]; // store y Points for the 10 points on the outer circle



  //  noLoop();
}

void draw() {
  background(255);
  translate(xCenter, yCenter);
  // scale(5);

  rect(0, 0, scale, scale);  // draw the boundray square 
  ellipse(0, 0, scale, scale);  // draw the boundray elipse 

  calculateNPoints(10, 0.5);
  drawPentagrams();
  strokeWeight(1);
  stroke(100);
  drawStar();
  strokeWeight(1);
  stroke(0, 0, 0);

  // First set of paralal guidelines
  ellipse(outerX[4], scale/14.4, 10, 10); // bottom left
  ellipse(outerX[4], - scale/14.4, 10, 10); // top left

  ellipse(outerX[1], scale/14.4, 10, 10); // bottom right
  ellipse(outerX[1], - scale/14.4, 10, 10); // top right

  line(outerX[4], - scale/14.4, outerX[1], - scale/14.4); // bottom line
  line(outerX[4], scale/14.4, outerX[1], scale/14.4); // bottom line
  // First set of paralal guidelines


  // 2nd set of paralal guidelines
  rotate(radians(36));
  ellipse(outerX[4], scale/14.4, 10, 10); // bottom left
  ellipse(outerX[4], - scale/14.4, 10, 10); // top left

  ellipse(outerX[1], scale/14.4, 10, 10); // bottom right
  ellipse(outerX[1], - scale/14.4, 10, 10); // top right

  line(outerX[4], - scale/14.4, outerX[1], - scale/14.4); // bottom line
  line(outerX[4], scale/14.4, outerX[1], scale/14.4); // bottom line
  // 2nd set of paralal guidelines


  // 3rd set of paralal guidelines
  rotate(radians(36));
  ellipse(outerX[4], scale/14.4, 10, 10); // bottom left
  ellipse(outerX[4], - scale/14.4, 10, 10); // top left

  ellipse(outerX[1], scale/14.4, 10, 10); // bottom right
  ellipse(outerX[1], - scale/14.4, 10, 10); // top right

  line(outerX[4], - scale/14.4, outerX[1], - scale/14.4); // bottom line
  line(outerX[4], scale/14.4, outerX[1], scale/14.4); // bottom line
  // 3rd set of paralal guidelines


  // 4th set of paralal guidelines
  rotate(radians(36));
  ellipse(outerX[4], scale/14.4, 10, 10); // bottom left
  ellipse(outerX[4], - scale/14.4, 10, 10); // top left

  ellipse(outerX[1], scale/14.4, 10, 10); // bottom right
  ellipse(outerX[1], - scale/14.4, 10, 10); // top right

  line(outerX[4], - scale/14.4, outerX[1], - scale/14.4); // bottom line
  line(outerX[4], scale/14.4, outerX[1], scale/14.4); // bottom line
  // 4th set of paralal guidelines



  // 5th set of paralal guidelines
  rotate(radians(36));
  ellipse(outerX[4], scale/14.4, 10, 10); // bottom left
  ellipse(outerX[4], - scale/14.4, 10, 10); // top left

  ellipse(outerX[1], scale/14.4, 10, 10); // bottom right
  ellipse(outerX[1], - scale/14.4, 10, 10); // top right

  line(outerX[4], - scale/14.4, outerX[1], - scale/14.4); // bottom line
  line(outerX[4], scale/14.4, outerX[1], scale/14.4); // bottom line
  // 5th set of paralal guidelines

  //  println("mouse X" + (mouseX - 300));
  //  println("mouse Y" + (mouseY - 300));

  //  println("Distance = " + dist(mouseX, mouseY, 300, 300));

  float innerScale = 0.589;
  calculateNinnerPoints(80, innerScale /2);
  strokeWeight(1);
  ellipse(0, 0, scale * innerScale, scale * innerScale);
  strokeWeight(1);

  innerMost = 0.171;  // was 0.237
  calculateNinnerMostPoints(20, innerMost /2);
  stroke(255, 0, 0);
  strokeWeight(1);
  ellipse(0, 0, scale * innerMost, scale * innerMost);

  strokeWeight(1);

  // ellipse(0, 0, 146.86388 * 2, 146.86388 * 2);
}


void calculateNPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    outerX[counter] = x;
    outerY[counter] = y;
    //stroke(100);
    //   line(0, 0, x, y);
    stroke(255, 0, 0);
    ellipse(x, y, 20, 20);
    stroke(0);
    noFill();

    counter ++;
  }
} // end  calculateNPoints


void calculateNinnerPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    innerX[counter] = x;
    innerY[counter] = y;
    //stroke(100);
    //   line(0, 0, x, y);
    // stroke(255, 0, 0);
    ellipse(x, y, 10, 10);
    stroke(100);
    noFill();

    counter ++;
  }
} // end  calculateNinnerPoints


void calculateNinnerMostPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    innerMostX[counter] = x;
    innerMostY[counter] = y;
    //stroke(100);
    //   line(0, 0, x, y);
    stroke(100);
    ellipse(x, y, 7, 7);
    // stroke(0);
    noFill();

    counter ++;
  }
} // end  calculateNinnerMostPoints



void drawPentagrams() {
  for (int counter = 0; counter < 8; counter ++) {
    // draw the guidelines for the 10 pointed star
    line(outerX[counter], outerY[counter], outerX[counter + 2], outerY[counter + 2]);
  }
  line(outerX[8], outerY[8], outerX[0], outerY[0]);
  line(outerX[9], outerY[9], outerX[1], outerY[1]);
} // end drawPentagrams


void drawStar() {
  for (int counter = 0; counter < 7; counter ++) {
    // draw the guidelines for the 10 pointed star
    line(outerX[counter], outerY[counter], outerX[counter + 3], outerY[counter + 3]);
  }
  line(outerX[7], outerY[7], outerX[0], outerY[0]);
  line(outerX[8], outerY[8], outerX[1], outerY[1]);
  line(outerX[9], outerY[9], outerX[2], outerY[2]);

  strokeWeight(3);
  line(outerX[5], outerY[5], innerX[fillCount], innerY[fillCount]);
  fill(255, 0, 0);
  ellipse(innerX[fillCount], innerY[fillCount], 5, 5);
  println("fillCount = " + fillCount);

  drawLines();
} // end drawStar


void mousePressed() {
  scale = 1200; // scale of bounding square
}

void mouseReleased() {
  scale = 500; // scale of bounding square
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("Islamic_004_07.png"); 
    exit();
  }

  if (key == 'c' || key == 'C') {



    fillCount ++;
  }
}

void drawLines() {

  strokeWeight(4);
  stroke(0);
  line(outerX[5], outerY[5], innerX[51], innerY[51]);
  line(outerX[5], outerY[5], innerX[29], innerY[29]);

  line(outerX[0], outerY[0], innerX[69], innerY[69]);
  line(outerX[0], outerY[0], innerX[11], innerY[11]);

  line(innerX[51], innerY[51], innerMostX[15], innerMostY[15]);
  line(innerX[29], innerY[29], innerMostX[5], innerMostY[5]);

  line(innerX[69], innerY[69], innerMostX[15], innerMostY[15]);
  line(innerX[11], innerY[11], innerMostX[5], innerMostY[5]);


  stroke(100);
}
