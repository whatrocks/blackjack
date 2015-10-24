assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'bust', ->
    it 'should trigger a busted event', ->
       sinon.spy(window.Hand, 'trigger');.
      highCard1 = new Card
        rank: 12
        suit: 1
      highCard2 = new Card
        rank: 12
        suit: 2
      highCard3 = new Card
        rank: 12
        suit: 3  
      hand.add(highCard1)
      hand.add(highCard2)
      hand.add(highCard3)

      hand.checkScore()      
