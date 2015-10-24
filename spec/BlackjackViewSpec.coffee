assert = chai.assert

describe "cardView", ->

  # it "should create a card collection", ->
  #   collection = new Deck()
  #   assert.strictEqual collection.length, 52


describe 'hit', ->
  it 'should add a card to the view', ->
    app = new AppView(model: new App())
    eventSpy = sinon.spy()
    app.on(app.model.get('game').get('playerHand'), eventSpy)
    $('.hit-button').click()
    expect(eventSpy).to.have.been.called
# assert = chai.assert


# describe 'cardView', ->
#   deck = null
#   hand = null

#   beforeEach ->
#     # deck = new Deck()
#     # hand = deck.dealPlayer()




#   describe 'bust', ->
#     it 'should trigger a busted event', ->
#        sinon.spy(window.Hand, 'trigger');.
#       highCard1 = new Card
#         rank: 12
#         suit: 1
#       highCard2 = new Card
#         rank: 12
#         suit: 2
#       highCard3 = new Card
#         rank: 12
#         suit: 3  
#       hand.add(highCard1)
#       hand.add(highCard2)
#       hand.add(highCard3)

#       hand.checkScore()      
