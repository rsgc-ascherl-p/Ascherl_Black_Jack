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

int hh17; //Determine's if the value of the house's hand is equal to or greater than 17 and less than 21
int cash; //Player's balance 

int hcontinue; //Determines whether to give the house more cards
int phold; //Makes it so when the player holds they cant hit anymore

int[] ph = new int[5]; //Declare Player Hand Array
int[] hh = new int[5]; //Declare House Hand Array

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

  //Give player a starting balance of 20 (only able to bet 5)
  cash = 25;
  
  //Balance Counter
  fill(0);
  textSize(30);
  text("Balance = " + cash, 75, 415);

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

  //Way to determine if the house's 2,3,4,5 cards have been used

  hh[0] = 1;
  hh[1] = 0;
  hh[2] = 0;
  hh[3] = 0;
  hh[4] = 0;

  //House's First Card Value and text

  h1 = int(random(1, 10));

  fill (0);
  textSize(20);
  text("" + h1, 180, 110);

  //Value for rest of House's Cards
  h2 = 0;
  h3 = 0;
  h4 = 0;
  h5 = 0;

  //Commands to make it so when player holds they cant hit anymore and to let program know that it should calculate the houses turn
  hcontinue = 0;
  phold = 0;

  //Text Commands for the hosue's cards
  fill (0);
  textSize(20);
  text("" + h2, 280, 110);

  fill (0);
  textSize(20);
  text("" + h3, 380, 110);

  fill (0);
  textSize(20);
  text("" + h4, 480, 110);

  fill (0);
  textSize(20);
  text("" + h5, 580, 110);

  //Value to determine whether the house's value is equal to or greater than 17 but less than or equal 21
  hh17 = 0;
}

void draw () {
  //Players Card Value Text Display for cards 3 4 and 5

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
    cash = cash + 5;
  } else if (p1 + p2 + p3 + p4 + p5 > 21) {
    fill(255, 0, 0);
    textSize(70);
    text("House Wins", 225, 237);
  } else if (p1 + p2 + p3 + p4 + p5 < 21 && ph[0] == 1) {
    fill(0, 0, 255);
    textSize(70);
    text("Player Wins", 225, 237);
    cash = cash + 5;
  }

  //Computer Logic for cards 3, 4 and 5 to see if the house must continue drawing cards
  if (hcontinue == 1 && hh[2] == 0 && h1 + h2 + h3 + h4 + h5 < 17) {

    fill(255);
    rect(350, 50, 75, 100);

    h3 = int(random(1, 10)); 

    fill (0);
    textSize(20);
    text("" + h3, 380, 110);

    hh[2] = 1;
  }

  if (hcontinue == 1 && h1 + h2 + h3 + h4 + h5 < 17 && hh[2] == 1 && hh[3] == 0) {

    fill(255);
    rect(450, 50, 75, 100);

    h4 = int(random(1, 10));

    fill (0);
    textSize(20);
    text("" + h4, 480, 110);

    hh[3] = 1;
  }

  if (hcontinue == 1 && h1 + h2 + h3 + h4 + h5 < 17 && hh[3] == 1 && hh[4] == 0) {

    fill(255);
    rect(550, 50, 75, 100);

    h5 = int(random(1, 10));

    fill (0);
    textSize(20);
    text("" + h5, 580, 110);

    hh[4] = 1;
  } 
  //If vaule of house's cards is equal to or greater than 17 and equal to or smaller than 21
  if (h1 + h2 + h3 + h4 + h5 >= 17 && h1 + h2 + h3 + h4 + h5 <= 21) {    
    hh17 = 1;
    //Different text messagaes than can appear after the house can't draw any cards anymore
  } else if (hcontinue == 1 && h1 + h2 + h3 + h4 + h5 > 21) {
    fill(0, 0, 255);
    textSize(70);
    text("Player Wins", 225, 237);
    cash = cash + 5;
  } 
  if (hcontinue == 1 && hh17 == 1 && (h1 + h2 + h3 + h4 + h5) < (p1 + p2 + p3 + p4 + p5) ) {
    fill(0, 0, 255);
    textSize(70);
    text("Player Wins", 225, 237);
    cash = cash + 5;
  } 
  if (hcontinue == 1 && hh17 == 1 && (h1 + h2 + h3 + h4 + h5) > (p1 + p2 + p3 + p4 + p5) ) {
    fill(255, 0, 0);
    textSize(70);
    text("House Wins", 225, 237);
  }
  if (hcontinue == 1 && hh17 == 1 && (h1 + h2 + h3 + h4 + h5) == (p1 + p2 + p3 + p4 + p5) ) {
    fill(254, 209, 77);
    textSize(70);
    text("Tied", 225, 237);
  }
  if (hcontinue == 1 && h1 + h2 + h3 + h4 + h5 == 21) {
    fill(255, 0, 0);
    textSize(70);
    text("House BlackJack", 225, 237);
  }
}

void mouseClicked () {

  //Hit mouseclicked commands, if you press hit and youre revealed cards equal less than 21 add a card
  if (mouseX > 50 && mouseX < 100 && mouseY > 175 && mouseY < 225 && p1 + p2 + p3 + p4 + p5 <= 21 && ph[1] == 1 && ph[2] == 0 && phold == 0) {   

    fill(255);
    rect(350, 250, 75, 100);

    p3 = int(random(1, 10));
    ph[2] = 1;
  } else if (mouseX > 50 && mouseX < 100 && mouseY > 175 && mouseY < 225 && p1 + p2 + p3 + p4 + p5 <= 21 && ph[2] == 1 && ph[3] == 0 && phold == 0) {   

    fill(255);
    rect(450, 250, 75, 100);

    p4 = int(random(1, 10));
    ph[3] = 1;
  } else if (mouseX > 50 && mouseX < 100 && mouseY > 175 && mouseY < 225 && p1 + p2 + p3 + p4 + p5 <= 21 && ph[3] == 1 && ph[4] == 0 && phold == 0) { 

    fill(255);
    rect(550, 250, 75, 100);

    p5 = int(random(1, 10));
    ph[0] = 1;
  }

  //If you press hold let computer determine how many cards to draw and draw a second card for house
  if (mouseX > 50 && mouseX < 100 && mouseY > 250 && mouseY < 300 && h1 + h2 + h3 + h4 + h5 < 17 && hh[0] == 1 && hh[1] == 0) {

    fill(255);
    rect(250, 50, 75, 100);

    h2 = int(random(1, 10));

    fill (0);
    textSize(20);
    text("" + h2, 280, 110);

    hh[1] = 1;

    hcontinue = 1;
    phold = 1;
  }
}