//Black Jack by Pierre-Christof Ascherl

float P1; //Value for the first card in the players hand 
float P2; //Value for the second card in the players hand 
float P3; //Value for the third card in the players hand 
float P4; //Value for the fourth card in the players hand 
float P5; //Value for the fifth card in the players hand 

float H1; //Value for the first card in the houses hand
float H2; //Value for the second card in the houses hand
float H3; //Value for the third card in the houses hand
float H4; //Value for the fourth card in the houses hand
float H5; //Value for the fifth card in the houses hand

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

//hit and hold buttons
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

//Balance Counter
fill(0);
textSize(30);
text("Balance = __", 75, 415);
}

void draw () {
}

void mouseClicked () {
}