class window.GameView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
      <button class="play-again-button">Play Again</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '
  className: 'game container col-md-6'
  
  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> 
      @model.get('playerHand').stand()
    'click .play-again-button': -> 
      @model.playAgain()
      @render()

  initialize: ->
    @render()

  render: ->
    # debugger;
    @$el.children().detach()
    @$el.html(@template())
    @$('.player-hand-container').html new HandView(collection: @model.get('playerHand')).el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('dealerHand')).el

