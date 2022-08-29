//Basic class definition
//--defining class
class Distance {
    //type property
    static let kmPerMile = 1.60934
    static let feetPerKm: Double = 5280
    
    //instance property
    var miles:Double
    //computed property
    var km:Double {
        //read-only, cannot be updated
        //return Distance.toKm2(miles: miles)
        
        //implementing getter and setter
        get {
            return Distance.toKm2(miles: miles)
        }
        set(newkm){
            miles = Distance.toMiles(km: newkm)
        }
    }
    
    //initialiser
    init(miles:Double){
        self.miles = miles
    }
    //convenience initialiser (main one above initialise all instance property, this complete initialisation process)
    convenience init(km:Double){
        self.init(miles: Distance.toMiles(km:km))
    }
    
    //methods: function inside class
    func toKm(miles:Double) -> Double{
        return miles * Distance.kmPerMile
    }
    static func toMiles(km:Double) -> Double {
        return km / kmPerMile;
    }
    //type method: can access class variable easily
    static func toKm2(miles:Double) -> Double {
        return miles * kmPerMile
    }
    //overloading (different parameter names or different data types)
    static func toKm2(feet:Double) -> Double {
        return feet / feetPerKm
    }
}

//creating new instance
var distance = Distance(km: 60)
//modifying computed property (after implementing setter and getter)
distance.km = 35



//Class inheritance
class Telephone {
    func makeCall() {
        //make call
    }
    func hangUp() {
        //hang up a call
    }
}

//inheritance
class Cellular: Telephone {
    //overriding
    override func makeCall() {
        //inherit parent class
        super.makeCall()
        //aditional thing to make cellular call
    }
    func sendMsg() {
        //send SMS
    }
}

//protocol (similar to interface in other language)
//class that inherit this protocol must implement the method defined in it
protocol TelephoneP {
    var phoneNo: Int {get set} //tell adopting class that they need to implement this property
    func makeCall()
    func hangUp()
}
//adopting from protocol without extension
class Cell: TelephoneP {
    var phoneNo: Int
    init(phoneNo: Int) {
        self.phoneNo = phoneNo
    }
    func makeCall() {
        //make a call
    }
    func hangUp() {
        //hang up a call
    }
}
//extending protocol
extension TelephoneP {
    func makeCall() {
        //make call
    }
    func hangUp() {
        //hang up call
    }
}
//adopting from protocol with extension
class Landline: TelephoneP {
    var phoneNo: Int
    init(phoneNo: Int) {
        self.phoneNo = phoneNo
    }
}
