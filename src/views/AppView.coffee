class window.AppView extends Backbone.View
  
  initialize: ->
    @navView = new NavView();
    @gameView = new GameView(model: @model.get('game'))
    @historyView = new HistoryView(model: @model.get('game'))
    @render()

  render: ->
    @$el.html [@navView.$el, @gameView.$el, @historyView.$el]
    # @$el.children().detach()
    # @$el.html @template()
    # @$('.player-hand-container').html new HandView(collection: @model.get('game').get('playerHand')).el
    # @$('.dealer-hand-container').html new HandView(collection: @model.get('game').get('dealerHand')).el

