class window.NavView extends Backbone.View
  
  className: 'nav-view navbar navbar-default'

  initialize: ->
    @render()

  render: ->
    # debugger;
    @$el.children().detach()
    @$el.html('<span>navView</span>')

