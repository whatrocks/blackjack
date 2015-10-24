class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'message', 'Welcome!'
    @set 'wins', 0
    @set 'losses', 0
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
    # if(@get('deck').length < 4)
    #   @set 'deck', deck = new Deck()
    #   @gameOver('Out of Cards.  Shuffling a new hand...')
    # else {  
      @set 'message', 'Welcome!'
      console.log('game start')
      @set 'playerHand', @get('deck').dealPlayer()
      @set 'dealerHand', @get('deck').dealDealer()
#player blackjack   
      @get('playerHand').on 'blackjack', => 
        @get('dealerHand').reveal()
        win = @get 'wins'
        @set 'wins', win + 1 
        @gameOverAlert("Blackjack!!!")
        # @dealerTurn()
  
      @get('playerHand').checkScore()
      @get('playerHand').on 'busted', =>
        loss = @get 'losses'
        @set 'losses', loss + 1 
        @gameOverAlert("You busted!")
  
#dealer bust
      @get('dealerHand').on 'busted', => 
        win = @get 'wins'
        @set 'wins', win + 1 
        @gameOverAlert("Dealer busted. You win!")
#player stand, run dealer's turn
      @get('playerHand').on 'stand', ->
        @get('dealerHand').reveal()
        @dealerTurn()
      ,@
  
#dealer round
      @get('dealerHand').on 'continue', ->
        @get('dealerHand').hit()
        # @dealerTurn()
      ,@
#compare end game
      @get('dealerHand').on 'compare blackjack', ->
        dealerScore = @get('dealerHand').getScore()
        playerScore = @get('playerHand').getScore()
        if playerScore > dealerScore 
          win = @get 'wins'
          @set 'wins', win + 1 
          @gameOverAlert("You beat the dealer. Good job, dude.")
        else if playerScore == dealerScore
          @gameOverAlert("It's a tie.")
        else 
          loss = @get 'losses'
          @set 'losses', loss + 1 
          @gameOverAlert("Ouch! You lose!!")
      ,@
  #out of cards event
      @get('playerHand').on 'outOfCards', =>
        @set 'deck', deck = new Deck()
        @gameOverAlert('Out of Cards.  Shuffling a new hand...')
      ,@

       @get('dealerHand').on 'outOfCards', =>
        @set 'deck', deck = new Deck()
        @gameOverAlert('Out of Cards.  Shuffling a new hand...')
      ,@
    # }

  gameOverAlert: (message) =>
    @set 'message', message;
    @trigger 'gameOver'