 
float gravity = 1;                      
int distX = 400;
int distY = 150;
int iter = 0;
boolean alive = false;
int score = 5;
boolean first = false;
float speed = 1;
PImage background;
PFont font;

Obj chicken = new Obj();
Bounds bounds = new Bounds();
Barrier[] barrier = new Barrier[5];

void setup()               
{
  
for(int i=0;i<5;i++)
{
barrier[i] = new Barrier(); 
barrier[i].rposX = -barrier[i].rSizeX;
barrier[i].loadImg();
barrier[i].setLength();
barrier[i].setWhiteTransparent();
barrier[i].setWhiteTransparentTop();
}
 
chicken.loadImg();
chicken.posY = -40;
chicken.setWhiteTransparent();
background = loadImage("background.png");
size(600,400);
}

void draw()
{
image(background,0,0,600,400);
println(chicken.posY);
    if((keyPressed == true && chicken.posY == height/2) || first == true)
    {
    chicken.setPos();
    first = true;
    speed = 10;
    }
    else if(first == false)
    {
    chicken.dropDown(); 
    }

    if(keyPressed == true && iter == 1  && alive == false)
    {
    chicken.jump();
    iter = 0;
    }
    else if(keyPressed == false)
    {
    iter = 1;
    }

    if(alive == false)
    {
    bounds.setGround();
    }
    else if(alive == true && chicken.posY > height+20 && barrier[0].rposY <= -600 && barrier[0].rposY1 >= 500)
    {    
    distX = 400;
    iter = 0;
    alive = false;
    score = 5;
    first = false;
    speed = 1;
    setup();
    }

    for(int i=0;i<5;i++)
    { 
      
     barrier[i].setBarriers();
    
        if(alive == false)
        {
        barrier[i].setSpeed(speed); 
        barrier[i].hitWall();
        barrier[i].dropDown();
        barrier[i].moving(); 
        }
        else
        {     
        barrier[i].riseUp(); 
        }
        
        if(barrier[i].rposX < -barrier[i].rSizeX)
        { 
            if(i == 0)
            {
             barrier[i].rposX = barrier[4].rposX+barrier[4].rSizeX+distX;
            }
            else
            {
            barrier[i].rposX = barrier[i-1].rposX+barrier[i-1].rSizeX+distX;
            }
        barrier[i].setLength();
        distX = 150;
        }
        
        if(barrier[i].rposX == chicken.posX)
        {
         score++; 
        }
    }
    
textSize(20);
fill(0);
text(score-5,50,50);
bounds.setRoof();
chicken.createObj();
 
    if(speed == 1)
    {
    speed = 0;
    }
}