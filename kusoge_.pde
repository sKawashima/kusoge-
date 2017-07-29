void setup() {
  size(800, 600);
  eX = random(0, width-10);
  eY = random(0, height-10);
  time++;
}

float pSize = 15;

float eX;
float eY;

int status = 0;//0=not start 1=start 2=end
int score = 0;
int time = 10;
int nowSecond = -1;
int highScore = 0;

void draw() {
  background(255);

  if (mousePressed) {
    fill(0, 50);
    if (mouseX - pSize < eX && mouseX + pSize >eX + 10 && mouseY - pSize < eY && mouseY + pSize >eY + 10) {
      background(255, 0, 0);
      eX = random(0, width-10);
      eY = random(0, height-10);
      if (status == 0) {
        status = 1;
      } else if (status == 1) {
        score++;
      }
    }
    if (status == 2 && mouseButton == RIGHT) {
      status = 0;
      score = 0;
      time = 10;
      nowSecond = -1;
    }
    //println(mouseX - pSize+","+eX+","+(mouseX + pSize)+","+eX + 10);
  } else {
    noFill();
  }

  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
  rect(mouseX - pSize, mouseY - pSize, pSize*2, pSize*2);

  fill(0);
  if (status != 2) {
    rect(eX, eY, 10, 10);
  }
  textSize(14);
  if (status == 0) {
    text("HighScore:" + highScore + " shot -> start", 10, 20);
  } else if (status == 1) {
    text("time:" + time + " score:" + score + " HighScore:" + highScore, 10, 20);
    if (nowSecond != second()) {
      time--;
      nowSecond = second();
    }
    if (time <= 0) {
      status = 2;
    }
  } else if (status == 2) {
    text("Your Score:" + score + " HighScore:" + highScore + " right click to Return", 10, 20);
    if (score > highScore) {
      highScore = score;
    }
  }
}