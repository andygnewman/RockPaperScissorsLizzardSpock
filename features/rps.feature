Feature: Rock, Paper, Scissors
  In order to waste a few minutes
  As a person with time on my hands
  I want to play a game of Rock, Paper, Scissors

  Scenario: Starting the game
  Given I am on the homepage
  Then I should see "Rock, Paper, Scissors"

  Scenario: Entering a choice
  Given I am on the homepage
  When I fill in "choice" with "Rock"
  And I click on "submit"
  Then I should see "Your choice was Rock"

  