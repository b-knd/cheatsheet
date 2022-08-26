//importing framework
import UIKit

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




//____________________________________________________________________________________________________________________________________________//

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

//____________________________________________________________________________________________________________________________________________//

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
