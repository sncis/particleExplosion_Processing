class Particle {
  int size;
  PVector position;
  PVector speed;
  PVector gravity;
  ArrayList <PVector> partDirection = new ArrayList<PVector>();;
  int margin = 2;
  int partNumber = 5; 
  float splash = 5;
  float currentHue = 0;
  
  Particle(PVector location){
    float startX = location.x + random(-splash, splash);
    float startY = location.y + random(-splash, splash);
    
    startX = constrain(startX, margin, width - margin); 
    startY = constrain(startY, margin, height - margin);
    
    position = new PVector(startX, startY);
    speed = new PVector(random(-5,5), random(-5,5)); 
    gravity = new PVector(0,0.02); 
  }
  
  void move(){
    position.add(speed);
    speed.add(gravity);
    
    partDirection.add(new PVector(position.x, position.y)); 
    
    if(partDirection.size() > partNumber*2){ 
     partDirection.remove(0); 
    }  
  }
  
  void drawQueu(){
    for(int i = 0 ; i < partDirection.size() - 1 ; i++){
      PVector temp = partDirection.get(i);
      PVector temp2 = partDirection.get(i+1);
      
      currentHue ++;

      fill(0,255,currentHue);
      stroke(0,255,currentHue);
      ellipse(temp.x, temp.y, size, size);
      temp2.add(new PVector(random(-2,2), random(-2,2)));
      line(temp.x, temp.y, temp2.x, temp2.y);
      ellipse(temp2.x,temp2.y, size, size);
    }
  }
  
  void setSize(int size){
    this.size = size;
  }
  
  boolean isDead(){
    if(position.x < 0 || position.x > width){
      return true;
    }
    if(position.y < 0 || position.y> height){
      return true;
    }
    return false;
  }
  
  void run(){
    move();
    drawQueu();
  }
}
