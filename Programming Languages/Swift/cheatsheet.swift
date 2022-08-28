//importing framework
import UIKit

//____________________________________________________________________________________________________________________________________________

/*
3. CONTROL FLOW
*/

//IF, ELSE, WHILE
var val = 99
while val >= 0 {
    if (val == 0) {
        print("Empty")
    } else if val == 1 {
        print("1 left")
    } else {
        print("\(val) left")
    }
    val -= 1
}


//FOR-IN
//--range extraction
//closed: inclusive
for index in 1...3 {
    print("\(index)")
}
//half-open: exclusive
for index in 1..<3 {
    print("\(index)")
}
//--reverse
for index in (0..<100).reversed() {
    print("\(index)")
}
//--one-sided range
var nums = [0, 1, 2, 3, 4]
for i in nums[3...] {
    print(i)    //print 3 and 4 (go all the way until last element)
}


//SWITCH
//no break necessary
for i in (0..<100).reversed() {
    switch i {
        case 0:
            print("No more")
        case 1:
            print("1 left")
        case 2...100:   //interval matching
            print("\(i) left")
        default:
            print("Error")
    }
}


//FUNCTIONS
//--definition
func serve(drink:String, curtomer: String) -> String {
    return("\(customer), your \(drink) is served")
}
//--calling
print(serve(drink:"beer", customer:"Billy"))
//--external parameter
func serve(drink: String, to customer: String) -> String {
    return ("\(customer), your \(drink) is served")
}
print(serve(drink:"beer", to:"Billy"))
//--calling without external parameter
func serve(_ drink: String, to customer: String) -> String {
    return ("\(customer), your \(drink) is served")
}
print(serve("beer", to: "Billy"))
//--default parameter
funct serve(_ drink: String = "Beer", to customer: String = "Billy") -> String {
    return ("\(customer), your \(drink) is served")
}
print(serve())


//OPTIONALS
//optional contains either a thing of certain type or nil (eg. A strign optional contains either nil or String)
//--declaration
var main: String?
//--unwrapping optionals (force unwrapping assume optional is not nil, optional binding use if or guard statements to check
//force unwrapping
print("Your \(main!.uppercased()) is served!") //adding ! so that main is unwrapped with the expectation that it is an appropriate data types
//optional binding
if let mainVal = main { 
    print("Your \(mainVal.uppercased()) is served!")    
}
var drink:String? = "Malbec"
if let main = main, let drink = drink { //multiple optional binding
    print("Your \(main.uppercased()) pairs well with \(drink.uppercased())")
}
//guard statement
func serve(drink: String? = nil) -> String {
    guard let drink = drink, drink != "Kool-Aid" else {
        return("No drink for you")
    }
    return ("Your \(drink) is served")
}
//ternary conditional operator
var default = "Stirred"
var specialMix:String?
specialMix = "Shaken"
let prepareMartini = specialMix != nil ? specialMix!: defaultMix    //condition ? if true do this: if false do this
//nil coalescing operator
let prepareMartini = specialMix ?? defaultMix   //optional if not nill ?? alternative value
//implicitly unwrapped optional: if you are sure the object won't be nil and have been instantiated before
var main: String!
main = "Steak"
print("Your \(main.uppercased()) is served!")
//--optional chaining (chain together multiple optionals)
var reserved = [[true,  true,  false],
                [false, false, false],
                [true,  true,  false]
]
if let firstTable = reserved.firt?.first {  //replacing 'if let firstRow = reserved.first, let firstTable = firstRow.first'
    let reservedText = firstTable ? "reserved" : "vacant"
    print("Best table in the house is \(reservedText)!"
}


//TUPLES
//finite group of element
//--declaration and initialisation
var meal1: (String,Double)
var meal2 = ("Turkey chili soup", 2.99)
var meal3: (name: String, price: Double)
var meal4 = (name: "Bread", price: 2)
meal4.price = 3
//--extracting element
print("\(meal2.0) costs \(meal2.1)")
//--tuple as return value
func chefSpecial() -> (name: String, price: Double) {
    return (name:"Crab bisque", price: 3.99)
}
var meal = chefSpecial()
//--type alias (define an alias for a type)
typealias Meal = (name: String, price: Double)
func chefSpecial() -> Meal {
}
//--initialising variable with typle
var soup = (name: "Jambalaya", price: 2.99)
var (soupName, soupPrice) = soup
var (soupName, soupPrice) = ("Tomato soup", 1.99)
//--swapping variables
var mealLeft = "Fish and chips"
var mealRight = "Burger and fries"
(mealLeft, mealRight) = (mealRight, mealLeft)
  
    
//HIGHER-ORDER FUNCTIONS
//function that can receive function as parameter
//--map
//instead of doing this
var prices = [3, 1.99, 2, 1.99, 1.70]
var updatedPrices: [Double] = []
for price in prices {
    updatedPrices.append(price * 1.1)
}
//we create a function and pass to map (map apply action on every element of a collection and return a new collection)
func updatePrice(price: Double -> Double {
    return price * 1.1
}
var updatedPrices = prices.map(updatePrice)
//--closures (function without name)
var updatedPrices = prices.map { {$0 * 1.1} }
//--filter
var filteredPrices = prices.filter { {$0 >= 5} }
//--reduce
var totalPrice = prices.reduce(0, {$0 + $1})
//--sorted
var sortedPrices = prices.sorted(by: {$0 > $1}} //descending

    
//____________________________________________________________________________________________________________________________________________

/*
2. COLLECTIONS
*/

//ARRAYS 
//--declaring
var array:[String] = []
//--instantiating
array = ["hello", "world"]
//--adding element
array.insert("!", at: 2) //specifying index
array.append("!") //without index
//--interating
//without index
for i in array {
    print(i)
}
//with index
for (index, i) in array.enumerated(){
    print("No. \(index+1): \(i)")
}
//--extracting element
let i = array.first
let j = array[1]
//--extracting range
let firstTwo = array[0...1]
//--concatenating
let p = ["It's a great day!"]
array = p + array


//SETS
//--declaration
var sets:Set<String>
//--initialization
sets = ["A", "B", "C"]
//--adding and removing element
sets.insert("D")
sets.remove("D")
//--iteration
for i in sets {
    print(i)
}
//--combining sets
var anotherSets:Set = ["D", "E", "F", "G"]
var unionOfTwo = sets.union(anotherSets) //some other combination includes: intersection, symmetric difference and subtraction


//DICTIONARIES
//--declaration
var dict: [String:String] = [:]
//--initialisation
dict = ["a": "apple",
        "b": "balloon",
        "c": "cellphone"]
//--extracting and removing element
let a = dict["a"]
dict["a"] = nil
//--checking
dict.isEmpty
//--iteration
for (alp, words) in dict {
    print("\(a) is \(words)")
}
//--extracting keys and values
let keys = Array(dict.keys)
let vals = Array(dit.values)

//____________________________________________________________________________________________________________________________________________

/*
1. TYPE SAFETY AND TYPE INFERENCE:
*/

//DECLARING VARIABLES
//1.without specifying data type, better practice
var str = "Hello, playground" 
//2.specifying data type (if value is not assigned to it yet)
var feedback: String 
if paymentSuccessful {
    feedback = "Payment Successful!"
} else {
    feedback = "Unsuccessful!"
}
//3.clarifying data types while declaring
var quantitySoup:Double = 2


//CONVERTING NUMERIC TYPES
var totalSlices = 8
var numberOfPeople = 3
var slicesPerPerson = Double(totalSlices) / Double(numberOfPeople) //without converting, the division returns 2 instead of double
//some other data types: UInt(unsigned integer), Float, Double, Int


//CONCATENATING STRINGS
var name = "Jerry"
var message = "Welcome " + name //only if name is string
//preventing type safe error
//1. convert data types
var cost = 3.50
var message = "This costs $" + String(cost)
//2. string interpolation
var message = "This costs $\(cost)"



//url
var url = NSURL(string: "http://www.craiggrummitt.com")

//loop
for x in 0..<10 {
    x * x
}

//color
var color:UIColor = .purple

//control
//slider
var slider = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
