class Bounds extends Obj
{

void setGround()
{
if(chicken.posY > height-50)
{
die();
}
}

void setRoof()
{
if(chicken.posY < -10 && first == true)
{
chicken.posY = -10; 
} 
}
}