class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
#player bust check on score change
    @get('playerHand').on 'busted', -> 
      console.log('player busted!!')

#player stand, run dealer's turn
    @get('playerHand').on 'stand', ->
      console.log('standing')
      @dealerTurn()
    ,@

#dealer round
    @get('dealerHand').on 'continue', ->
      console.log('dealer must continue')
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
    @get('dealerHand').hit();
    @get('dealerHand').dealerContinue();
    return




    #dealerBust
    #playerWin
    #dealerWin