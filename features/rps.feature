Feature: Initial Task - Rock, Paper, Scissors
  In order to waste a few minutes
  As a person with time on my hands
  I want to play a game of Rock, Paper, Scissors vs the computer

  Scenario: Starting the game
  Given I am on the homepage
  Then I should see "Rock, Paper, Scissors"

  Scenario: Before starting a game
  Given I am on the homepage
  Then I should see "Please enter a name for Player 1"

  Scenario: Entering a choice
  Given I have filled in a name for Player 1
  When I fill in "choice" with "Rock"
  And I click on "submit"
  Then I should see "Andy chose rock"

  Scenario: Entering an invalid choice
  Given I am on the homepage
  When I fill in "choice" with "Banana"
  And I click on "submit"
  Then I should see "Banana is not valid, please choose again"



  