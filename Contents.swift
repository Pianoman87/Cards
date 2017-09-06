import UIKit

struct Card {
    var color : String
    var roll : Int
}

//let card = Card(color : "Red", roll : rollValue)
//print(card)

class Deck {
    var cards = [Card]()
    init(){
        var count = 0
        for i in 0...9 {
            var rollValue1 = Int(arc4random_uniform(UInt32(1 + 4 - 3))) + 3
            cards.append(Card(color : "Red", roll : rollValue1))
            count += 1
            var rollValue2 = Int(arc4random_uniform(UInt32(1 + 2 - 1))) + 1
            cards.append(Card(color : "Blue", roll : rollValue2))
            count += 1
            var rollValue3 = Int(arc4random_uniform(UInt32(1 + 6 - 5))) + 5
            cards.append(Card(color : "Green", roll : rollValue3))
            count += 1
        }
    }
    func deal() -> Any {
        if cards.count != 0 {
            var pop = self.cards.remove(at: 0)
            return pop
        }
        else {
            return "No more cards!"
        }
    }
    func isEmpty() -> Bool {
        if self.cards.count == 0 {
            return true
        }
        else {
            return false
        }
    }
    func shuffle() {
        var length = self.cards.count
    
        for i in 1...100 {
            var index1 = Int(arc4random_uniform(UInt32(length)))
            var index2 = Int(arc4random_uniform(UInt32(length)))
            
            if index1 != index2 {
                var temp = self.cards[index1]
                self.cards[index1] = self.cards[index2]
                 self.cards[index2] = temp
            }
        }
       
    }
}

class Player {
    var name : String
    var hand = [Card]()
    init( name: String) {
        self.name = name
        
    }
    func draw(deck: Deck) -> Any {
//        return deck.cards[0]
        if deck.cards.count != 0 {
            var pop = deck.cards.remove(at: 0)
            self.hand.append(pop)
            return pop
        }
        else {
            return "No more cards!"
        }
    }
    func rollDice() -> Int{
        var diceRoll = Int(arc4random_uniform(UInt32(1 + 6 - 1))) + 1
        return diceRoll
    }
    func matchingCards(color : String, roll : Int) -> Int {
        var count = 0
        for i in hand {
            if i.color == color && i.roll == roll {
                count += 1
            }
        }
        return count
    }
}

var deck = Deck()
var player1 = Player(name: "Jon")

print(player1.name)
print(player1.hand)
player1.draw(deck: deck)
print(player1.hand)
var hand = player1.hand
print(hand[0].color)
player1.draw(deck: deck)
player1.draw(deck: deck)
print(player1.hand)
player1.draw(deck: deck)
print(player1.hand)
player1.draw(deck: deck)
print(player1.hand)
print(player1.matchingCards(color: "Red", roll: 4))








//print(deck.cards)
//print("******************")
//deck.shuffle()
//print(deck.cards)


