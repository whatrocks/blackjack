class window.NavView extends Backbone.View
  className: 'nav-view navbar navbar-default'
  initialize: ->
    @render()
    @model.on 'change', @render, @


  render: ->
    wins = @model.get('wins')
    losses = @model.get('losses')

    msg = @model.get('message')
    @$el.html('<div class="message"><h1>' + msg + 
      '</h1></div><div class=summary><h2> Wins: ' + wins + ' Losses: ' + losses + ' cards left: ' + @model.get('deck').length + '</h2></div>')