Feature: Two player verison
  In order to waste a few minutes
  As a person with time on my hands and a friend
  I want to play a game of Rock, Paper, Scissors against my friend

  Scenario: Before starting a game
  Given I have reset the game
  And I am on the homepage
  Then I should see "Please enter a name for Player 2"

  Scenario: Entering a valid name for player 2
  Given I have reset the game
  And I am on the homepage
  And I have filled in "player_1_name" with "Andy" and "player_2_name" with "Rachel"
  And I uncheck "play_against_the_computer"
  And I click on "submit"
  Then I should see "Current Scores: Andy: 0 Rachel: 0"

  Scenario: Entering an invalid name for Player 2
  Given I have reset the game
  And I am on the homepage
  And I have filled in "player_1_name" with "Andy" and "player_2_name" with ""
  And I uncheck "play_against_the_computer"
  And I click on "submit"
  Then I should see "You must enter a name for Player 2"

  Scenario: Entering a valid name for Player 2 but not unchecking play against computer
  Given I have reset the game
  And I am on the homepage
  And I have filled in "player_1_name" with "Andy" and "player_2_name" with "Rachel"
  And I click on "submit"
  Then I should see "Current Scores: Andy: 0 Computer: 0"

  Scenario: Making choice for second player
  Given I have registered two players for the game
  When I click on "rock"
  Then I should see "Rachel, please make your selection"

  Scenario: evaluating the winner from a 2 player game
  Given I have registered two players for the game
  When I click on "paper"
  And I click on "scissors"
  Then I should see "Rachel wins"
