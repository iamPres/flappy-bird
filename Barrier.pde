class Barrier extends Obj
{
  
int rSizeX = 50;
float rSizeTY = 558;
float rposX = 500;
float rposY = 0;
float rposY1 = 350;
float rposX1 = 500-rSizeX; 
float rSizeBY = 558;
float rposYE;
float moveSpeed = 10;
float moveChance;
PImage img,imgT;
int count;

void loadImg()
{
 img = loadImage("wall.png"); 
 imgT = loadImage("wallB.png");
}
  
void setBarriers()
{
image(img,rposX,rposY1,rSizeX,rSizeBY);
image(imgT,rposX,rposY,rSizeX,rSizeTY);
}

void setLength()
{
rposY = -560;
rposY1 = 410;
rposYE = random(50,250);
moveChance = random(1,15);
}

void dropDown()
{
if(rposY < rposYE-rSizeTY && rposX < 500)
{
rposY += 20;
}

if(rposY1 > rposYE+distY && rposX < 500)
{
rposY1 -= 20;
}
}

void riseUp()
{
if(rposY > -600)
{
rposY -= 20;
}
if(rposY < 500)
{
rposY1 += 20;
}
}

void moving()
{
if(moveChance > 13
)
{
//moveSpeed = moveChance;
rposYE += moveSpeed;
rposY += moveSpeed;
rposY1 += moveSpeed;
if(rposY1 > height || rposY+rSizeTY < 0)
{
moveSpeed *= -1;
}
}
}

void setSpeed(float speed)
{
rposX -= speed; 
}

void hitWall()
{
if((chicken.posY+chicken.size-15 > rposY1 || chicken.posY+15 < rSizeTY-abs(rposY))&&(chicken.posX+chicken.size-15 > rposX && chicken.posX+15 < rposX+rSizeX) && alive == false)
 {
   chicken.die();
 }
}

void setWhiteTransparentTop()
{
  int[]  maskArray=new int[imgT.width*imgT.height];
  imgT.loadPixels();
  for (int i=0;i<imgT.width*imgT.height;i++)
  {
    if((imgT.pixels[i] & 0x00FFFFFF) == 0x00FFFFFF)
    {
      maskArray[i]=0;      
    }
    else
    {
      maskArray[i]=imgT.pixels[i] >>> 24;
    }
  }

  imgT.updatePixels();
  imgT.mask(maskArray);  
} 

void setWhiteTransparent()
{
  int[]  maskArray=new int[img.width*img.height];
  img.loadPixels();
  for (int i=0;i<img.width*img.height;i++)
  {
    if((img.pixels[i] & 0x00FFFFFF) == 0x00FFFFFF)
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