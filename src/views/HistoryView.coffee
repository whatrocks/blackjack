class window.HistoryView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
      <button class="play-again-button">Play Again</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('game').get('playerHand').hit()
    'click .stand-button': -> 
      @model.get('game').get('playerHand').stand()
    'click .play-again-button': -> 
      @model.get('game').playAgain()
      @render()



  initialize: ->
    @render()

  render: ->
    @$el.children().detach() 
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get('game').get('playerHand')).el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('game').get('dealerHand')).el

