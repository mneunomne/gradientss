int w, h;

float _a = 1;
float _s = 1;

void setup() { 
  size(500, 500);
  pixelDensity(2);
  w = width * 2;
  h = height * 2;
  colorMode(HSB);
}

void draw () {
 _a = frameCount%10000;
 _s = 0.7* frameCount%10000;
 loadPixels();
 for (int y = 0; y < h; y++){
   for (int x = 0; x < w; x++) {
     float _x = float(x) / width;
     float _y = float(y) / height;
     int i = x + (y*w);

     float x1 = cos(_x * PI*2);
     float y1 = sin(_y * PI*4);

     // your aliasing chain, now feeding into each other
     float c  = cos(_x*y1 * PI*_a/100);
     float s  = sin(_y*x1 * PI*_s/(mouseX+1) + c*3);
     float s2 = sin(s*y1 * PI*_s*0.46*random(1)/(mouseX+1) + _x*x1*_a*0.05);
     float g  = cos((c + s2) * _a*random(1) + s*y1*20);

     // no remap, so negatives clip to black (keeps it harsh)
     pixels[i] = color(c * s *255,  g * 255);
   }
 }
 updatePixels();
 
}
