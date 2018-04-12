PImage face;
PImage contour;

PImage mountain;
PImage hill;
PImage grass;
PImage sea;
PImage deep;

PImage bg;

int mountainCounter = 0;
int hillCounter = 0;
int grassCounter = 0;
int seaCounter = 0;
int deepCounter = 0;

float tolerance = 3;

void setup() {
  size(1000, 1250);

  // load and display the image
  face = loadImage("Images/happy.jpg");
  //face.resize(500, 700);
  
  contour = adaptiveThreshold(face, dia, adjustment);

  //if (face.width >face.height) {
  //  face.resize(500, 0);
  //} else {
  //  face.resize(0, 600);
  //}

  mountain = loadImage("landscapes/mountainsS.jpg");
  //mountain.resize(500, 700);
  hill = loadImage("landscapes/hills.jpg");
  //hill.resize(500, 700);
  grass = loadImage("landscapes/grassS.jpg");
  //grass.resize(500, 700);
  sea = loadImage("landscapes/water.jpg");
  //sea.resize(500, 700);
  deep = loadImage("landscapes/deep.jpg");
  //deep.resize(500, 700);
  bg = loadImage("landscapes/bg.jpg");
  //bg.resize(500, 700);
  

  //}

  //void draw() {

  //image(face, 0, 0);
  face.loadPixels();

  mountain.loadPixels();
  hill.loadPixels();
  grass.loadPixels();
  sea.loadPixels();
  deep.loadPixels();
  bg.loadPixels();

  for (int i=0; i < face.pixels.length; i++) {
    float r = face.pixels[i] >> 16 & 0xFF;
    float g = face.pixels[i] >> 8 & 0xFF;
    float b = face.pixels[i] & 0xFF;

    if (
    (r >= 0-tolerance && r <= 0+tolerance) &&
      (g >= 255-tolerance && g <= 255+tolerance) && 
      (b >= 66-tolerance && b <= 66+tolerance)) {
      face.pixels[i] = bg.pixels[i];
    } else {

      //darkest - deep sea
      if ( brightness(face.pixels[i]) < 51 ) {

        //if (deepCounter >= deep.pixels.length) {
        //  deepCounter = 0;
        //}
        //face.pixels[i] = deep.pixels[deepCounter];
        face.pixels[i] = deep.pixels[i];
        println(deep.pixels[deepCounter]);
        deepCounter += 1;

        //sea level
      } else if ( 51 <= brightness(face.pixels[i]) && brightness(face.pixels[i]) < 102 ) {

        //if (seaCounter >= sea.pixels.length) {
        //  seaCounter = 0;
        //}
        //face.pixels[i] = sea.pixels[seaCounter];
        face.pixels[i] = sea.pixels[i];
        println(sea.pixels[seaCounter]);
        seaCounter += 1;

        //grass
      } else if (102 <= brightness(face.pixels[i]) && brightness(face.pixels[i]) < 153) { 

        //if (grassCounter >= grass.pixels.length) {
        //  grassCounter = 0;
        //}
        //face.pixels[i] = grass.pixels[grassCounter];
        face.pixels[i] = grass.pixels[i];
        println(grass.pixels[grassCounter]);
        grassCounter += 1;

        //hills
      } else if (153 <= brightness(face.pixels[i]) && brightness(face.pixels[i]) < 204) { 

        //if (hillCounter >= hill.pixels.length) {
        //  seaCounter = 0;
        //}
        //face.pixels[i] = hill.pixels[hillCounter];
        face.pixels[i] = hill.pixels[i];
        println(hill.pixels[hillCounter]);
        hillCounter += 1;

        //highest - mountains
      } else if (204 <= brightness(face.pixels[i]) && brightness(face.pixels[i]) < 255) {

        //if (mountainCounter >= mountain.pixels.length) {
        //  mountainCounter = 0;
        //}
        //face.pixels[i] = mountain.pixels[mountainCounter];
        face.pixels[i] = mountain.pixels[i];
        println(mountain.pixels[mountainCounter]);
        mountainCounter += 1;
      }
    }
  }

  face.updatePixels();
  image(face, 0, 0);
  //updatePixels();
  
 
  //image(contour, 0, 0);
  
  println("color: " + green(get(2, 2)));
  save("HumanTopography.jpg");
}