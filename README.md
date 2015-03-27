# Rock Paper Scissors

## Makers Academy Weekly Challenge - Week 3

Solo weekend coding challenge from Makers Academy in which I completed all levels of the challenge, including optional bonus requirements.
First solo challenge on incorporating browser and server side Ruby utilising the Sinatra framework.

###Play the game on the web
Deployed on heroku [https://rpsls-andy.herokuapp.com/](https://rpsls-andy.herokuapp.com/)

###Technology Used

- Ruby
- Sinatra
- embedded Ruby
- HTML
- CSS
- Rspec
- Cucumber
- Capybara

![Andy Newman's Rock Paper Scissors Lizzard Spock game screenshot](https://github.com/andygnewman/RockPaperScissorsLizzardSpock/blob/master/rpsls-screenshot.png)

###To play the game locally
Clone this repository
From command line, within the root of the project directory `$ rackup`. This will start the server.
Then in browser open [http://localhost:9292](http://localhost:9292).

###To run the tests
From the command line, within the root of the directory;
Unit Tests (Rspec) `$ rspec`
Feature Tests (Cucumber / Capybara) `$ cucumber`

###Learning points
- separation of flow control / game logic between controller (rps.rb) and backend code (game.rb)
- layout file to manage overall html formatting
- minimising session variables
- use of partials to make client side code more readable

###What more I would do
- improve front end display formatting, especially where optional fields are not returned, to improve consistency of user experience.

### Requirements of the challenge - by Makers Academy

The Makers Academy Marketing Array ( **MAMA** ) have asked us to provide a game for them.

Your task is to provide a _Rock, Paper, Scissors_ game for them so they can play on the web with the following features:

- the marketeer has to enter their name before the game
- the marketeer will be presented the choices (rock, paper and scissors)
- the marketeer can choose one option
- the game will choose a random option
- a winner will be declared

###Rōnin BANZAI!!!!**

### Bonus 1: Multiplayer

Change the game so that two marketeers can play against each other ( _yes there are two of them_ ).

### Bonus 2: Rock, Paper, Scissors, Spock, Lizard

Use the _special_ rules ( _you can find them here http://en.wikipedia.org/wiki/Rock-paper-scissors-lizard-Spock_ )

### Basic Rules

- Rock beats Scissors
- Scissors beats Paper
- Paper beats Rock
