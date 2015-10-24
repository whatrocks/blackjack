class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'message', 'Welcome!'
    @startGame()
  
  dealerTurn: ->
    # console.log 'executing dealers turn'
    @get('dealerHand').checkScore();
    return


  playAgain: =>
    @get('playerHand').reset()
    @get('dealerHand').reset()
    @startGame()

  startGame: =>
    @set 'message', 'Welcome!'
    console.log('game start')
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
#player bust   
    @get('playerHand').on 'busted', => 
      @gameOverAlert("You busted!")

#dealer bust
    @get('dealerHand').on 'busted', => 
      @gameOverAlert("Dealer busted. You win!")
#player stand, run dealer's turn
    @get('playerHand').on 'stand', ->
      @get('dealerHand').reveal();
      @dealerTurn()
    ,@

#dealer round
    @get('dealerHand').on 'continue', ->
      @get('dealerHand').hit()
      # @dealerTurn()
    ,@
#compare end game
    @get('dealerHand').on 'compare', ->
      dealerScore = @get('dealerHand').getScore()
      playerScore = @get('playerHand').getScore()
      if playerScore > dealerScore 
        @gameOverAlert("You beat the dealer. Good job, dude.")
      else if playerScore == dealerScore
        @gameOverAlert("It's a tie.")
      else 
        @gameOverAlert("Ouch! You lose!!")
    ,@

  gameOverAlert: (message) =>
    @set 'message', message;
    @trigger 'gameOver'
    msg = message + " Play again?"
    # if confirm msg then @playAgain()