

class Obj
{
int posX = 50;
int posY;
float velY;
int size = 50; 
PImage img;

void loadImg()
{
img = loadImage("imgres.png");
}
  
void createObj()
{
image(img,posX,posY,size,size);  
}

void setPos()
{
posY += velY;
velY += gravity;
}

void jump()
{
velY = -8;
}

void die() 
{
  jump(); 
  alive = true;
}

void dropDown()
{
if(posY < height/2)
{
 posY += 20;
}
}

void rotateIt()
{
rotate(1);  
}

void setWhiteTransparent()
{
  int[]  maskArray=new int[img.width*img.height];
  img.loadPixels();
  for (int i=0;i<img.width*img.height;i++)
  {
    if((img.pixels[i] & 0x0070C5CE) == 0x0070C5CE)
    {
      maskArray[i]=0;      
    }
    else
    {
      maskArray[i]=img.pixels[i] >>> 24;
    }
  }

  img.updatePixels();
  img.mask(maskArray);  
} 
}