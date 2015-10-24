class window.HistoryView extends Backbone.View
  template: _.template '
      <div class="hist-entry"><%= cards %></div>
  '
  #   <div class="scorebar">Scorebar</div>
  #   <div class="history-stream">History Stream</div>'

  # className: 'container col-md-6 hist-view'
  className: 'container col-md-6 history-stream'

  initialize: ->
    # @model.get('playerHand').on 'add change reset remove', => @render()
    # @render()
    @model.on 'gameOver', =>
      @render()


  render: ->
    # @$el.children().detach()
    # debugger;
    cards = @model.get('playerHand').map (card) -> new CardView(model: card).$el
    entry = $('<div class="hist-entry container"></div>')
    entry.append cards
    @$el.prepend entry

    # @$el.html(@template())
    # @$el.find('.history-stream').append @model.get('playerHand').map (card) ->
    #   new CardView(model: card).$el


  # when hand is over, this view needs to append the player's hand
