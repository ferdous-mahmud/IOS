import Foundation

let pizzaInInches: Int = 16
let numberofPeople: Int = 12
let slicePerPerson: Int = 5

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let totlaSliceOfPizzaNeeded = numberofPeople * slicePerPerson
        return totlaSliceOfPizzaNeeded / numberOfSlices
    }
}

print("Pizza to buy: \(numberOfPizza)")


