class window.CardView extends Backbone.View
  className: 'card'

  tagName: 'img'

  template: _.template 'img/cards/<%= rankName %>-<%= suitName %>.png'
  # template: _.template '<%= rankName %> of <%= suitName %>'
  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.attr('src', @template @model.attributes)
    @$el.html
    @$el.addClass 'covered' unless @model.get 'revealed'