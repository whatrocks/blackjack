class window.HistoryView extends Backbone.View
  template: _.template '
    <div class="scorebar">Scorebar</div>
    <div class="history-stream">History Stream</div>'

  className: 'container col-md-6 hist-view'

  initialize: ->
    @render()

  render: ->
    # debugger;
    @$el.children().detach()
    @$el.html(@template())

