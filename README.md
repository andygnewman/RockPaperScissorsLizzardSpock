#Rock Paper Scissors
##Makers Academy Weekly Challenge - Week 3

Knowing how to build web applications is getting us almost there as web developers!

The Makers Academy Marketing Array ( **MAMA** ) have asked us to provide a game for them. Their daily grind is pretty tough and they need time to steam a little.

Your task is to provide a _Rock, Paper, Scissors_ game for them so they can play on the web with the following features:

- the marketeer has to enter their name before the game
- the marketeer will be presented the choices (rock, paper and scissors)
- the marketeer can choose one option
- the game will choose a random option
- a winner will be declared

As always you can use google your notes and everything else. This is a challenge for you and you only!

###Rōnin BANZAI!!!!**

### Bonus 1: Multiplayer

Change the game so that two marketeers can play against each other ( _yes there are two of them_ ).

### Bonus 2: Rock, Paper, Scissors, Spock, Lizard

Use the _special_ rules ( _you can find them here http://en.wikipedia.org/wiki/Rock-paper-scissors-lizard-Spock_ )

### Basic Rules

- Rock beats Scissors
- Scissors beats Paper
- Paper beats Rock

##Andy's Notes

Completed all levels of the challenge.

###To play the game
from command line $ ruby ./lib/rps.rb

###Following code review I;
- implemented layout and partials to improve readability of the code associated with the html
- moved to image input of choices from text based (reduces error opportunity and makes it more playable)
- moved remaining process out of rps controller into game where the game logic resides
- 
###What more I would do
- improve front end display formatting, especially where optional fields are not returned.
- 
###Learning points
- separation of flow control / game logic
- layout file to manage overall html formatting
- minimising session variables
- use of partials to make code more readable
