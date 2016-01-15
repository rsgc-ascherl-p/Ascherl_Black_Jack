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
int gm;   //Trigger to know when balance is less than 0
//key r;    //When you press r key when balance is less than 0 restart game

int hcontinue; //Determines whether to give the house more cards
int phold; //Makes it so when the player holds they cant hit anymore

int[] ph = new int[5]; //Declare Player Hand Array
int[] hh = new int[5]; //Declare House Hand Array

int s1; //Prevent further looping for balance to not continuously going up or down
int s2; //Prevent further looping for balance to not continuously going up or down
int s3; //Prevent further looping for balance to not continuously going up or down
int s4; //Prevent further looping for balance to not continuously going up or down
int s5; //Prevent further looping for balance to not continuously going up or down
int s6; //Prevent further looping for balance to not continuously going up or down
int s7; //Prevent further looping for balance to not continuously going up or down
int s8; //Prevent further looping for balance to not continuously going up or down

void setup () {
  //Canvas Size
  size(650, 475);

  //Grey Background 
  fill(170);
  rect(0, 0, 650, 475);

  //The deck shown on screen
  fill(255);
  rect(50, 50, 75, 100);

  fill(0);
  textSize(15);
  text("Deck", 70, 100);

  //the house's cards shown on screen as well as message displaying so
  fill(255);
  rect(150, 50, 75, 100);
  rect(250, 50, 75, 100);
  rect(350, 50, 75, 100);
  rect(450, 50, 75, 100);
  rect(550, 50, 75, 100);

  fill(0);
  textSize(30);
  text("The House Hand is above", 175, 215);


  //player's cards shown on screen as well as message displaying so 
  fill(255);
  rect(150, 250, 75, 100);
  rect(250, 250, 75, 100);
  rect(350, 250, 75, 100);
  rect(450, 250, 75, 100);
  rect(550, 250, 75, 100);

  fill(0);
  textSize(30);
  text("Your Hand is above", 300, 415);

  //Putting the hit, hold and redeal buttons on screen
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

  //Give player a starting balance of 20 (only able to bet 5 per round)
  cash = 25;

  //Players Cards 1 and 2 Value set when game starts and all the rest set to 0
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

  //Value for player's cards meant to determine if the player's 3,4,5 cards have been used

  ph[0] = 0;
  ph[1] = 1;
  ph[2] = 0;
  ph[3] = 0;
  ph[4] = 0;

  //Value for house's cards meant to determine if the house's 2,3,4,5 cards have been used

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

  //Commands to make it so when player holds they cant hit anymore and to let program know that it should calculate the house's turn
  //hcontinue to run if statements in draw when player presses the hold button
  //phold is meant so the player can't hit if he has selected hold that turn
  hcontinue = 0;
  phold = 0;

  //Text Commands for the house's cards
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

  //Ways to stop end of game messages from repeating and staying on screen
  s1 = 0;
  s2 = 0;
  s3 = 0;
  s4 = 0;
  s5 = 0;
  s6 = 0; 
  s7 = 0;
  s8 = 0;
}

void draw () {

  //Players Card Value Text Display for player cards 3 4 and 5
  fill (0);
  textSize(20);
  text("" + p3, 380, 310);

  fill (0);
  textSize(20);
  text("" + p4, 480, 310);

  fill (0);
  textSize(20);
  text("" + p5, 580, 310);

  //Check if the player has blackjack

  if (p1 + p2 + p3 + p4 + p5 == 21 && s1 == 0 && cash > 0) {
    fill (0, 0, 255);
    textSize(70);
    text("BLACKJACK!!!", 225, 237);
    cash = cash + 5;
    s1 = 1;
  } 
  //Check if the player's card values have gone over 21
  else if (p1 + p2 + p3 + p4 + p5 > 21 && s2 == 0 && cash > 0) {
    fill(255, 0, 0);
    textSize(70);
    text("House Wins", 225, 237);
    cash = cash - 5;
    s2 = 1;
  } 
  //Check if player has 5 cards revealed that are less than 21
  else if (p1 + p2 + p3 + p4 + p5 < 21 && ph[0] == 1 && s3 == 0 && cash > 0) {
    fill(0, 0, 255);
    textSize(70);
    text("Player Wins", 225, 237);
    cash = cash + 5;
    s3 = 1;
  }

  //Computer Logic for cards 3, 4 and 5 to see if the house must continue drawing cards
  if (hcontinue == 1 && hh[2] == 0 && h1 + h2 + h3 + h4 + h5 < 17) {

    fill(255);
    rect(350, 50, 75, 100);

    h3 = int(random(1, 11)); 

    fill (0);
    textSize(20);
    text("" + h3, 380, 110);

    hh[2] = 1;
  }

  if (hcontinue == 1 && h1 + h2 + h3 + h4 + h5 < 17 && hh[2] == 1 && hh[3] == 0) {

    fill(255);
    rect(450, 50, 75, 100);

    h4 = int(random(1, 11));

    fill (0);
    textSize(20);
    text("" + h4, 480, 110);

    hh[3] = 1;
  }

  if (hcontinue == 1 && h1 + h2 + h3 + h4 + h5 < 17 && hh[3] == 1 && hh[4] == 0) {

    fill(255);
    rect(550, 50, 75, 100);

    h5 = int(random(1, 11));

    fill (0);
    textSize(20);
    text("" + h5, 580, 110);

    hh[4] = 1;
  } 
  //If vaule of house's cards is equal to or greater than 17 and equal to or smaller than 21
  if (h1 + h2 + h3 + h4 + h5 >= 17 && h1 + h2 + h3 + h4 + h5 <= 21) {    
    hh17 = 1;

    //Different text messagaes than can appear after the house can't draw any cards anymore
  } else if (hcontinue == 1 && h1 + h2 + h3 + h4 + h5 > 21 && s4 == 0 && cash > 0) {
    fill(0, 0, 255);
    textSize(70);
    text("Player Wins", 225, 237);
    cash = cash + 5;
    s4 = 1;
  } 
  if (hcontinue == 1 && hh17 == 1 && (h1 + h2 + h3 + h4 + h5) < (p1 + p2 + p3 + p4 + p5) && s5 == 0 && cash > 0) {
    fill(0, 0, 255);
    textSize(70);
    text("Player Wins", 225, 237);
    cash = cash + 5;
    s5 = 1;
  } 
  if (hcontinue == 1 && hh17 == 1 && (h1 + h2 + h3 + h4 + h5) > (p1 + p2 + p3 + p4 + p5) && s6 == 0 && cash > 0) {
    fill(255, 0, 0);
    textSize(70);
    text("House Wins", 225, 237);
    cash = cash - 5;
    s6 = 1;
  }
  if (hcontinue == 1 && hh17 == 1 && (h1 + h2 + h3 + h4 + h5) == (p1 + p2 + p3 + p4 + p5) && s7 == 0 && cash > 0) {
    fill(254, 209, 77);
    textSize(70);
    text("Tied", 225, 237);
    cash = cash - 5;
    s7 = 1;
  }
  if (hcontinue == 1 && h1 + h2 + h3 + h4 + h5 == 21 && s8 == 0 && cash > 0) {
    fill(255, 0, 0);
    textSize(70);
    text("House BlackJack", 225, 237);
    cash = cash - 5;
    s8 = 1;
  }


  //Clear and reset balance counter after balance has changed depending on outcome of the game
  fill(170);
  noStroke();
  rect(75, 380, 200, 75);

  //Balance Counter
  fill(0);
  textSize(30);
  text("Balance = " + cash, 75, 415);

  //If balance is less than 0 make gm value 0 so player can restart game
  if (cash == 0) { 
    gm = 1;
  }

  //Show Lose Message and press r to restart

  if (gm == 1) {
    fill(0, 0, 255);
    textSize(40);
    text("Game Over! Press R to Restart", 225, 237);
  }
}

void mouseClicked () {

  //Hit mouseclicked commands, if you press hit and youre revealed cards equal less than 21 add a card
  if (mouseX > 50 && mouseX < 100 && mouseY > 175 && mouseY < 225 && p1 + p2 + p3 + p4 + p5 <= 21 && ph[1] == 1 && ph[2] == 0 && phold == 0 && gm == 0) {   

    fill(255);
    rect(350, 250, 75, 100);

    p3 = int(random(1, 11));
    ph[2] = 1;
  } else if (mouseX > 50 && mouseX < 100 && mouseY > 175 && mouseY < 225 && p1 + p2 + p3 + p4 + p5 <= 21 && ph[2] == 1 && ph[3] == 0 && phold == 0 && gm == 0) {   

    fill(255);
    rect(450, 250, 75, 100);

    p4 = int(random(1, 11));
    ph[3] = 1;
  } else if (mouseX > 50 && mouseX < 100 && mouseY > 175 && mouseY < 225 && p1 + p2 + p3 + p4 + p5 <= 21 && ph[3] == 1 && ph[4] == 0 && phold == 0 && gm == 0) { 

    fill(255);
    rect(550, 250, 75, 100);

    p5 = int(random(1, 11));
    ph[0] = 1;
  }

  //If you press hold let computer determine how many cards to draw and draw a second card for house
  if (mouseX > 50 && mouseX < 100 && mouseY > 250 && mouseY < 300 && h1 + h2 + h3 + h4 + h5 < 17 && hh[0] == 1 && hh[1] == 0 && cash > 0 && gm == 0) {

    fill(255);
    rect(250, 50, 75, 100);

    h2 = int(random(1, 11));

    fill (0);
    textSize(20);
    text("" + h2, 280, 110);

    hh[1] = 1;

    hcontinue = 1;
    phold = 1;
  }

  //Redeal button, resets eveyrhting for a new round
  if (mouseX > 50 && mouseX < 100 && mouseY > 325 && mouseY < 375 && gm == 0) {

    //House's Cards
    fill(255);
    rect(150, 50, 75, 100);
    rect(250, 50, 75, 100);
    rect(350, 50, 75, 100);
    rect(450, 50, 75, 100);
    rect(550, 50, 75, 100);

    //Player's Cards
    fill(255);
    rect(150, 250, 75, 100);
    rect(250, 250, 75, 100);
    rect(350, 250, 75, 100);
    rect(450, 250, 75, 100);
    rect(550, 250, 75, 100);

    //Players Card Value
    p1 = int(random(1, 11));

    fill (0);
    textSize(20);
    text("" + p1, 180, 310);

    p2 = int(random(1, 11));

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

    h1 = int(random(1, 11));

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

    fill(170);
    noStroke();
    rect(150, 152, 500, 100);

    fill(0);
    textSize(30);
    text("The House Hand is above", 175, 200);

    s1 = 0;
    s2 = 0;
    s3 = 0;
    s4 = 0;
    s5 = 0;
    s6 = 0; 
    s7 = 0;
    s8 = 0;
  }
}

void keyPressed () {
  if (key == 'r' && gm == 1) {
    //House's Cards
    fill(255);
    rect(150, 50, 75, 100);
    rect(250, 50, 75, 100);
    rect(350, 50, 75, 100);
    rect(450, 50, 75, 100);
    rect(550, 50, 75, 100);

    //Player's Cards
    fill(255);
    rect(150, 250, 75, 100);
    rect(250, 250, 75, 100);
    rect(350, 250, 75, 100);
    rect(450, 250, 75, 100);
    rect(550, 250, 75, 100);

    //Players Card Value
    p1 = int(random(1, 11));

    fill (0);
    textSize(20);
    text("" + p1, 180, 310);

    p2 = int(random(1, 11));

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

    h1 = int(random(1, 11));

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

    fill(170);
    noStroke();
    rect(150, 152, 500, 100);

    fill(0);
    textSize(30);
    text("The House Hand is above", 175, 200);

    s1 = 0;
    s2 = 0;
    s3 = 0;
    s4 = 0;
    s5 = 0;
    s6 = 0; 
    s7 = 0;
    s8 = 0;
    
    cash = 25;
    gm = 0;
  }
}