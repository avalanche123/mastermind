Mastermind
==========

The game of mastermind in Rails
This is a test project to familiarize myself with RSpec and Cucumber
The whole game is completely unit and functionally tested
The specs and features can be found under `/spec` and `/features` accordingly

##Rules

* To play the game, you will have to register and log in
* To start a game, you will need to click "Play" from your dashboard
* Computer will guess four pegs of two distinct colors (0101)
* You will be presented with a set of select boxes - one box for each peg
* Each select box will contain two numbers, representing colors (0 and 1)
* You will guess a combination of pegs you believe to match computer's
* After clicking "Submit", you will be shown the number of pegs you managed to guess
* When you guessed all pegs, the game is over and you won
* After 8 unsuccessful attempts, the game is over and you lost

## Installation

* Clone the repository
* In the repository root, run `bundle install`
* Create the database by running `rake db:migrate`

## Running tests

* Run `rake spec` to run specs
* Run 'rake cucumber` to run features

## Starting the game

* Run `rails server`
* Go to `localhost:3000` and follow game's instructions