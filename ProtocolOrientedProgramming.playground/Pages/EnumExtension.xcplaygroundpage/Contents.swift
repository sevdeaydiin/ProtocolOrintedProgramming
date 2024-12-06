
import Foundation

protocol Character {
    var name: String { get }
    var health: Int { get set }
    func attack()
}

protocol Movable {
    func move()
}

enum GameCharacter: Character {
    
    case savasci(health: Int)
    case buyucu(health: Int)
    case okcu(health: Int)
    
    var name: String {
        switch self {
        case .savasci: return "Warrior"
        case .buyucu: return "Mage"
        case .okcu: return "Archer"
        }
    }
    
    var health: Int {
        get {
            switch self {
            case .savasci(let health),
                    .buyucu(let health),
                    .okcu(let health):
                return health
            }
        }
        set {
            switch self {
            case .savasci:
                self = .savasci(health: newValue)
            case .buyucu:
                self = .buyucu(health: newValue)
            case .okcu:
                self = .okcu(health: newValue)
            }
        }
    }
    
    func attack() {
        switch self {
        case .savasci:
            print("\(name) swings a mighty sword!")
        case .buyucu:
            print("\(name) casts a fireball!")
        case .okcu:
            print("\(name) shoots an arrow!")
        
        }
    }
}

extension GameCharacter: Movable {
    func move() {
        print("\(name) moves swiftly!")
    }
}

var warrior = GameCharacter.savasci(health: 100)
var mage = GameCharacter.buyucu(health: 80)
var archer = GameCharacter.okcu(health: 90)

warrior.attack() // Warrior swings a mighty sword!
mage.attack()    // Mage casts a fireball!
archer.attack()  // Archer shoots an arrow!

warrior.move()   // Warrior moves swiftly!
mage.move()      // Mage moves swiftly!
archer.move()    // Archer moves swiftly!

mage.health -= 20
print("\(mage.name)'s health: \(mage.health)")
