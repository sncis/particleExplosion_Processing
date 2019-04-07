ArrayList<Particle> allParticles = new ArrayList<Particle>();
int MAX = 50 ; 
int particleSize = 1;


void setup(){
  size(500,500);
  background(0);
}

void draw(){
  background(0);
  for(Particle particle : allParticles){
    particle.setSize(particleSize);
    particle.run();
  }
}

void mousePressed(){
  for(int i = 0; i< MAX ; i++){
    allParticles.add(new Particle(new PVector(mouseX, mouseY)));
  } 
}

void checkIfParticleIsDead(){
  for(Particle part : allParticles){
    if(part.isDead()){
      allParticles.remove(part);
    }
  }
}
