class window.CardView extends Backbone.View
  className: 'card'

  tagName: 'div'

  template: _.template 'url("img/cards/<%= rankName %>-<%= suitName %>.png")'
  # template: _.template '<%= rankName %> of <%= suitName %>'
  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.css('background-image', @template @model.attributes)
    @$el.addClass 'covered' unless @model.get 'revealed'
    @$el.html