//Black Jack by Pierre-Christof Ascherl

int p1; //Value for the first card in the players hand 
int p2; //Value for the second card in the players hand 
int p3; //Value for the third card in the players hand 
int p4; //Value for the fourth card in the players hand 
int p5; //Value for the fifth card in the players hand 

int h1; //Value for the first card in the houses hand
int h2; //Value for the second card in the houses hand
int h3; //Value for the third card in the houses hand
int h4; //Value for the fourth card in the houses hand
int h5; //Value for the fifth card in the houses hand

int[] ph = new int[5]; //Declare Player Hand Array
int[] hh = new int[5]; //Declare House Hand Array

//ph = new int[5]; //Setting ph array to have 5 values 
//hh = new int[5]; //Setting hh array to have 5 values

void setup () {
  size(650, 475);

  //the deck
  fill(255);
  rect(50, 50, 75, 100);

  fill(0);
  textSize(15);
  text("Deck", 70, 100);

  //the house's cards
  fill(255);
  rect(150, 50, 75, 100);
  rect(250, 50, 75, 100);
  rect(350, 50, 75, 100);
  rect(450, 50, 75, 100);
  rect(550, 50, 75, 100);

  fill(0);
  textSize(30);
  text("The House Hand is above", 175, 215);


  //player's cards
  fill(255);
  rect(150, 250, 75, 100);
  rect(250, 250, 75, 100);
  rect(350, 250, 75, 100);
  rect(450, 250, 75, 100);
  rect(550, 250, 75, 100);

  fill(0);
  textSize(30);
  text("Your Hand is above", 300, 415);

  //hit, hold and redeal buttons
  fill(255);
  ellipse(75, 200, 50, 50);

  fill(0);
  textSize(15);
  text("Hit", 65, 205);

  fill(255);
  ellipse(75, 275, 50, 50);

  fill(0);
  textSize(15);
  text("Hold", 60, 280);
  
  fill(255);
  ellipse(75, 350, 50, 50);
  
  fill(0);
  textSize(13);
  text("Redeal", 55, 355);

  //Balance Counter
  fill(0);
  textSize(30);
  text("Balance = __", 75, 415);

  //Players Card Value
  p1 = int(random(1, 10));

  fill (0);
  textSize(20);
  text("" + p1, 180, 310);

  p2 = int(random(1, 10));

  fill (0);
  textSize(20);
  text("" + p2, 280, 310);

  p3 = 0;
  p4 = 0;
  p5 = 0;

  //Way to determine if the player's 3,4,5 cards have been used

  ph[0] = 0;
  ph[1] = 1;
  ph[2] = 0;
  ph[3] = 0;
  ph[4] = 0;

  //House's Card Value

  h1 = int(random(1, 10));

  fill (0);
  textSize(20);
  text("" + h1, 180, 110);

  h2 = 0;
  h3 = 0;
  h4 = 0;
  h5 = 0;

  fill (0);
  textSize(20);
  text("?", 280, 110);

  fill (0);
  textSize(20);
  text("?", 380, 110);

  fill (0);
  textSize(20);
  text("?", 480, 110);

  fill (0);
  textSize(20);
  text("?", 580, 110);
}

void draw () {
  //Players Card Value for cards 3 4 and 5

  fill (0);
  textSize(20);
  text("" + p3, 380, 310);

  fill (0);
  textSize(20);
  text("" + p4, 480, 310);

  fill (0);
  textSize(20);
  text("" + p5, 580, 310);

  //Check if the player went over 21

  if (p1 + p2 + p3 + p4 + p5 == 21) {
    fill (0, 0, 255);
    textSize(70);
    text("BLACKJACK!!!", 225, 237);
  } else if (p1 + p2 + p3 + p4 + p5 > 21) {
    fill(255, 0, 0);
    textSize(70);
    text("House Wins", 225, 237);
  } else if (p1 + p2 + p3 + p4 + p5 < 21 && ph[0] == 1) {

    fill(0, 0, 255);
    textSize(70);
    text("Player Wins", 225, 237);
  }
}

void mouseClicked () {

  if (mouseX > 50 && mouseX < 100 && mouseY > 175 && mouseY < 225 && p1 + p2 + p3 + p4 + p5 <= 21 && ph[1] == 1 && ph[2] == 0) {   

    fill(255);
    rect(350, 250, 75, 100);

    p3 = int(random(1, 10));
    ph[2] = 1;
  } else if (mouseX > 50 && mouseX < 100 && mouseY > 175 && mouseY < 225 && p1 + p2 + p3 + p4 + p5 <= 21 && ph[2] == 1 && ph[3] == 0) {   

    fill(255);
    rect(450, 250, 75, 100);

    p4 = int(random(1, 10));
    ph[3] = 1;
  } else if (mouseX > 50 && mouseX < 100 && mouseY > 175 && mouseY < 225 && p1 + p2 + p3 + p4 + p5 <= 21 && ph[3] == 1 && ph[4] == 0) { 

    fill(255);
    rect(550, 250, 75, 100);

    p5 = int(random(1, 10));
    ph[0] = 1;
  }
}