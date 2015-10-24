class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @last()
    @checkScore()
    console.log(@deck.length)

  stand: -> @trigger 'stand'

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  getScore: ->
    Math.min @scores()[0], @scores()[1]

  checkScore: -> 
    console.log 'check score'
    if @getScore() > 21 then @trigger 'busted'
    else if @getScore() >= 17 then @trigger 'compare'
    else @trigger 'continue'

  # dealerContinue: ->
  #   if @getScore() < 17 then @trigger 'continue'
  #   else 

  reveal: ->
    console.log("reveal")
    @first().flip()
