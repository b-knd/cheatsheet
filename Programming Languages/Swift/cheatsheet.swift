//importing framework
import UIKit

/*
Type safety and type inference:
*/

//declaring variable
var str = "Hello, playground" //without specifying data type, better practice
var feedback: String //specifying data type (if value is not assigned to it yet)
if paymentSuccessful {
    feedback = "Payment Successful!"
} else {
    feedback = "Unsuccessful!"
}


//defining string variable
var str = "Hello, world!"

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
