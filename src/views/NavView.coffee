class window.NavView extends Backbone.View
  className: 'nav-view navbar navbar-default'
  initialize: ->
    @render()
    @model.on 'change', @render, @

  render: ->
    msg = @model.get('message')
    @$el.html('<div class="message"><h1>' + msg + '</h1></div>')