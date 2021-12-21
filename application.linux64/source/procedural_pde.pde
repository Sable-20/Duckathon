int HEIGHT = 900;
int WIDTH = 1600;

int cols, rows;
int scl = 20;

float flying = 0;

float[][] TERRAIN;

void settings() {
  // fullScreen(P3D);
  size(WIDTH, HEIGHT, P3D);
}

void setup() {
  background(0);
  stroke(255);
  noFill();
  cols = WIDTH / scl;
  rows = HEIGHT / scl;
  
  TERRAIN = new float[cols][rows];
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        TERRAIN[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        xoff += 0.2;
      }
      yoff += 0.2;
  }
}

void draw() {
  flying -= 0.01;
  
  //float yoff = flying;
  //for (int y = 0; y < rows; y++) {
  //    float xoff = 0;
  //    for (int x = 0; x < cols; x++) {
  //      TERRAIN[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
  //      xoff += 0.2;
  //    }
  //    yoff += 0.2;
  //}
  
  translate(WIDTH / 2, HEIGHT / 2 + 30);
  rotateX(PI / 3);
  
  translate(-WIDTH / 2, -HEIGHT / 2);
  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x * scl, y * scl, TERRAIN[x][y]);
      vertex(x * scl, (y + 1) * scl, TERRAIN[x][y+1]);
    }
    endShape();
  }
}
