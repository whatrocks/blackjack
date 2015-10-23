# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    console.log "App Model"
    @set 'game', game = new Game()
    # @set 'deck', deck = new Deck()
    # @set 'playerHand', deck.dealPlayer()
    # @set 'dealerHand', deck.dealDealer()

