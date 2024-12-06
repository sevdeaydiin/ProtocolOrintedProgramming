import Foundation

protocol PaymentMethod {
    var name: String { get }
    func processPayment(amount: Double)
}

struct CreditCard: PaymentMethod {
    var name: String {
        return "Kredi Kartı"
    }
    
    func processPayment(amount: Double) {
        print("\(amount) TL tutarında ödeme \(name) ile gerçekleştirildi.")
    }
}

struct BankTransfer: PaymentMethod {
    var name: String {
        return "Banka Transferi"
    }
    
    func processPayment(amount: Double) {
        print("\(amount) TL tutarında ödeme \(name) ile gerçekleştirildi.")
    }
}

struct MobileWallet: PaymentMethod {
    var name: String {
        return "Mobil Cüzdan"
    }
    
    func processPayment(amount: Double) {
        print("\(amount) TL tutarında ödeme \(name) ile gerçekleştirildi.")
    }
}

let creditCardPayment = CreditCard()
creditCardPayment.processPayment(amount: 1000)

