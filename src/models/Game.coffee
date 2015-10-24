class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
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
    console.log('game start')
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
#player bust   
    @get('playerHand').on 'busted', -> 
      console.log('player busted!')

#dealer bust
    @get('dealerHand').on 'busted', -> 
      console.log('dealer busted!!')
#player stand, run dealer's turn
    @get('playerHand').on 'stand', ->
      @get('dealerHand').reveal();
      @dealerTurn()
    ,@

#dealer round
    @get('dealerHand').on 'continue', ->
      console.log 'dealer is continuing'
      @get('dealerHand').hit()
      # @dealerTurn()
    ,@
#compare end game
    @get('dealerHand').on 'compare', ->
      dealerScore = @get('dealerHand').getScore()
      playerScore = @get('playerHand').getScore()
      if playerScore > dealerScore 
        console.log('you win!')
      else if playerScore == dealerScore
        console.log("it's a tie!")
      else 
        console.log('you lose!')
    ,@




    #dealerBust
    #playerWin
    #dealerWin