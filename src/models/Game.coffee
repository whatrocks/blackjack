class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
#player bust check on score change
    @get('playerHand').on 'busted', -> console.log('busted!!')






    #dealerBust
    #playerWin
    #dealerWin