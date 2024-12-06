

import Foundation

protocol Filterable {
    associatedtype DataType
    func apply(to data: [DataType]) -> [DataType]
}

struct PriceFilter: Filterable {
   
    typealias DataType = Double
    var maxPrice: Double
    
    func apply(to data: [Double]) -> [Double] {
        return data.filter { $0 <= maxPrice }
    }
}

struct CategoryFilter: Filterable {
    typealias DataType = String
    var category: String
    
    func apply(to data: [String]) -> [String] {
        return data.filter { $0 == category }
    }
}

struct StockFilter: Filterable {
    
    typealias DataType = Bool
    var inStock: Bool
    
    func apply(to data: [Bool]) -> [Bool] {
        return data.filter { $0 == inStock }
    }
}

let prices: [Double] = [49.90, 19.90, 99.90, 149.90]
let priceFilter = PriceFilter(maxPrice: 50.0)
let filteredPrices = priceFilter.apply(to: prices)
print(filteredPrices)


let categories: [String] = ["Electronics", "Books", "Clothing"]
let categoryFilter = CategoryFilter(category: "Clothing")
let filteredCategories = categoryFilter.apply(to: categories)
print(filteredCategories)


struct CompositeFilter<F: Filterable>: Filterable {
    typealias DataType = F.DataType
    var filters: [F]

    func apply(to data: [F.DataType]) -> [F.DataType] {
        return filters.reduce(data) { currentData, filter in
            filter.apply(to: currentData)
        }
    }
}

//let compositeFilter = CompositeFilter(filters: [priceFilter, categoryFilter])
//let allFilteredPrices = compositeFilter.apply(to: prices)
//print(allFilteredPrices)
