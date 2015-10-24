class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
#player bust check on score change
    @get('playerHand').on 'busted', -> 
      # @endGame();
      # console.log('player busted!!')
      # @evaluate player score

#player stand, run dealer's turn
    @get('playerHand').on 'stand', ->
      console.log 'player standing, now dealer turn'
      console.log @get('dealerHand')
      console.log @get('playerHand')
      @get('dealerHand').reveal();
      @dealerTurn()
    ,@

#dealer round
    @get('dealerHand').on 'continue', ->
      console.log 'dealer is continuing'
      @dealerTurn()
    ,@
#dealer stand: game over, check scores
    # @get('dealerHand').on 'stand', ->
    #   console.log('game ended')
    # ,@
#dealer bust

    @get('dealerHand').on 'busted', -> 
      console.log('dealer busted!!')

  
  dealerTurn: ->
    console.log 'executing dealers turn'
    @get('dealerHand').hit();
    @get('dealerHand').dealerContinue();
    return


  playAgain: =>
    @get('playerHand').reset()
    @get('dealerHand').reset()
    console.log('playagain')
    # debugger
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()

    # @get('playerHand').on 'stand', ->
    #   console.log 'player standing, now dealer turn'
    #   console.log @get('dealerHand')
    #   console.log @get('playerHand')
    #   @get('dealerHand').reveal();
    #   @dealerTurn()
    # ,@
    return




    #dealerBust
    #playerWin
    #dealerWin