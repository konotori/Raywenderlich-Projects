import UIKit
import Foundation

// Generic Data Structure
struct Queue<Element> {
    var elements: [Element] = []
    
    mutating func enqueue(newElement: Element) {
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.remove(at: 0)
    }
}

var q = Queue<Int>()

q.enqueue(newElement: 4)
q.enqueue(newElement: 2)

print(q.elements)
q.dequeue()
print(q.elements)
q.dequeue()
print(q.elements)
q.dequeue()
print(q.elements)

// Extending a Generic Type

extension Queue {
  func peek() -> Element? {
    return elements.first
  }
}

q.enqueue(newElement: 5)
q.enqueue(newElement: 3)
q.peek() // 5

// Generic Function
func pairs<Key, Value>(from dictionary: [Key: Value]) -> [(Key, Value)] {
    return Array(dictionary)
}

let somePairs = pairs(from: ["minimum": 199, "maximum": 299])
print(somePairs)
// result is [("maximum", 299), ("minimum", 199)]

let morePairs = pairs(from: [1: "Swift", 2: "Generics", 3: "Rule"])
print(somePairs)
// result is [(1, "Swift"), (2, "Generics"), (3, "Rule")]

// Constraining a Generic Type
func mid<T: Comparable>(array: [T]) -> T? {
    guard !array.isEmpty else { return nil }
    return array.sorted()[(array.count - 1) / 2]
}
mid(array: [3, 5, 1, 2, 4]) // 3

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}
extension Int: Summable {}
extension Double: Summable {}

func add<T: Summable>(x: T, y: T) -> T {
  return x + y
}

add(x: 1, y: 2.9)

extension String: Summable {}
let addString = add(x: "Generics", y: " are Awesome!!! :]")

// Subclassing a Generic Type

class Box<T> {
  // Just a plain old box.
}


class Gift<T>: Box<T> {
  func wrap() {
    print("Wrap with plain white paper.")
  }
}

class Rose {
 var smell = ""
}

class ValentinesBox: Gift<Rose> {
    override func wrap() {
      print("Wrap with ♥♥♥ paper.")
    }

}

class Shoe {
  // Just regular footwear
}

class GlassSlipper: Shoe {
  // A single shoe, destined for a princess
}

class ShoeBox: Box<Shoe> {
  // A box that can contain shoes
}

let box = Box<Rose>() // A regular box that can contain a rose
let gift = Gift<Rose>() // A gift box that can contain a rose
let shoeBox = ShoeBox()
let valentines = ValentinesBox()

gift.wrap() // plain white paper
valentines.wrap() // ♥♥♥ paper

// Enumerations With Associated Values
enum Reward<T> {
  case treasureChest(T)
  case medal

  var message: String {
    switch self {
    case .treasureChest(let treasure):
      return "You got a chest filled with \(treasure)."
    case .medal:
      return "Stand proud, you earned a medal!"
    }
  }
}

let message = Reward.treasureChest("💰").message
print(message)



