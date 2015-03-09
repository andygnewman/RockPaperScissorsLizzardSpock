Feature: Initial Task - Rock, Paper, Scissors
  In order to waste a few minutes
  As a person with time on my hands
  I want to play a game of Rock, Paper, Scissors vs the computer

  Scenario: Starting the game
  Given I am on the homepage
  Then I should see "Rock, Paper, Scissors, Lizzard, Spock"

  Scenario: Before starting a game
  Given I am on the homepage
  Then I should see "Please enter a name for Player 1"

  Scenario: Entering an invalid name for Player 1
  Given I am on the homepage
  When I fill in "player_1_name" with ""
  And I click on "submit"
  Then I should see "Please enter a name for Player 1"

  Scenario: Entering a choice
  Given I have filled in a name for Player 1
  When I click on "rock"
  Then I should see "Andy chose rock"
