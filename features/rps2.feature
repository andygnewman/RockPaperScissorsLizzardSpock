Feature: Two player verison
  In order to waste a few minutes
  As a person with time on my hands and a friend
  I want to play a game of Rock, Paper, Scissors against my friend

  Scenario: Before starting a game
  Given I have reset the game
  And I am on the homepage
  Then I should see "Please enter a name for Player 2"

  Scenario: See player 2 set-up
  Given I have reset the game
  And I am on the homepage
  And I have filled in "player_1_name" with "Andy" and "player_2_name" with "Rachel"
  And I uncheck "play_against_the_computer"
  And I click on "submit"
  Then I should see "Current Scores: Andy: 0 Rachel: 0"

  Scenario: Making choice for second player
  Given I have registered two players for the game
  When I fill in "choice" with "Rock"
  And I click on "submit"
  Then I should see "Rachel, please enter your choice"

  Scenario: evaluating the winner from a 2 player game
  Given I have registered two players for the game
  When I fill in "choice" with "Paper"
  And I click on "submit"
  And I fill in "choice" with "Scissors"
  And I click on "submit"
  Then I should see "Rachel wins"