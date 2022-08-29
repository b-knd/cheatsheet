
//23. FUNCTIONAL PROGRAMMING
//function is also values and work as closure
var isOdd = function(int n) returns boolean {
  return n % 2 != 0;
}

type IntFilter function (int n) returns boolean;

function isEven(int n) returns boolean {
  return n % 2 == 0;
}

IntFilter f = isEven;

int[] nums = [1,2,3];
int[] evenNums = nums.filter(f); //return even number

//--asynchronous function call: process on separate logical thread/strand
future<int> f1 = start foo();
future<int> f2 = start foo();
//waiting for result
int x1 = check wait f1;
int x2 = check wait f2;
//alternative
record {| int|error f1; int|error f2; |} f = wait {f1, f2};
int x1 = check f.f1;
int x2 = check f.f2;

//______________________________________________________________________________________________


//22. MATCH STATEMENT
//similar to switch but more flexible coming to the data types
const KEY = "xyzzy";

function mtest(any v) returns string {

  match v {
    17 => { return "number"; }
    true => { return "boolean"; }
    "str" => { return "string"; }
    KEY => { return "constant"; }
    0|1 => { return "or"; }
    _ => { return "any"; }
  }
}

//______________________________________________________________________________________________

//21. ENUMERATIONS
enum Color {
  RED, GREEN, BLUE  //each enum is their string value "RED", "GREEN" and "BLUE" correspondingly
}
//or define explicitly
enum Language {
  ENG = "English",
  TL = "Tamil",
  SI = "Sinhala"
}

//______________________________________________________________________________________________

//20. CONST and FINAL
//--const: immutable singleton
const MAX_VALUE = 1000;
//--final: value that cannot be reassigned once initialised
final string msg = loadMessage();

//______________________________________________________________________________________________

//19. IDENTITY
//identity is determined by memory location, check using === and !==
MyClass obj1 = new MyClass();
MyClass obj2 = new MyClass();

//true
boolean b1 = (obj1 === obj1);
//false
boolean b2 = (obj1 === obj2);

//true
boolean b3 = ([1,2,3] == [1,2,3]) //deep comparison
//false
boolean b4 = ([1,2,3] === [1,2,3])

//______________________________________________________________________________________________

//18. OBJECT and CLASSES
//--creation of new object
function demoMyClass() {
  m:MyClass x = new m:MyClass(1234);
  x.foo();
  int n = x.n;
}
//--definition of class
class MyClass {
  private int n; //class variable
  
  public function init(int n = 0) { //constructor (return value if present, must return either error or nil: error?)
    self.n = n;
  }
  
  public function inc() {
    self.n += 1;
  }
  
  public function get() returns int {
    return self.n;
  }
}

//______________________________________________________________________________________________

//17. RETURN VALUE
//void function
func();
//function with return value, ballerina does not allow ignoring returning value
_ = func(); //assign to _
//if return value includes error type, have to be handled explicitly or use checkpanic
checkpanic tryX(); //but panic instead of returning

//______________________________________________________________________________________________

//16. ERROR HANDLING
//Normal error: error (logical)
function intFromBytes(byte[] bytes) returns int|error {
  string|erorr ret = string:fromBytes(bytes);
  
  if ret is error{
    return ret;
  } else{
    return int:fromString(ret);
  }
}
//--check expression
function intFromBytes(byte[] bytes) returns int|error {
  string str = check string:fromBytes(bytes);
  
  return int:fromString(str);
}

//Abnormal error: panic (runtime)
function divide(int m, int n) returns int {
  if n == 0 {
    panic error("division by 0");
  }
  return m/n;
}

//______________________________________________________________________________________________

//15. UNION
//combination of two or more data types, superset of the combination
type flexType string|int;
flexType a = 1;
flexType b = "Hello";

//checking union type
type StructuredName record {
  string firstName;
  string lastName;
};
type Name StructuredName|string;

funcion nameToString(Name nm) returns string {
  if nm is string {
    return nm;
  } else{
    return nm.firstName + " " + nm.lastName;
  }
}

//______________________________________________________________________________________________

//14. RECORDS
//collection of fields of specific type, let you have control over what your keys are
record { int x; int y; } r = {
  x: 1,
  y: 2,
};

type Coord record {
  int x;
  int y;
};
Coord c = {x: 1, y: 2};
int a = c.x;

//______________________________________________________________________________________________

//13. TYPE DEFINITIONS
type MapArray map<string>[];

//think of it as alias
MapArray arr = [
  {"x": "foo"},
  {"y": "bar"}
]

//______________________________________________________________________________________________

//12. MAPS
//--declaration
map<int> m = {
  "x": 1,
  "y": 2
}
//--replacement
m["x"] = 5;
//--extracting value, keys
int? v = m["x"]
string[] = map.keys()

//______________________________________________________________________________________________

//11. LOOPS

//--foreach
function sum(float[] v) returns float {
  float r = 0.0;
  foreach float x in v {
    r += x;
  }
  return r;
}
function sum(float[] v) returns float [
  float r = 0.0;
  foreach int i in 0..<v.length() {
    r += v[i];
  }
}

//--while
type LinkedList record {
  string value;
  LinkedList? next;
};

function len(LinkedList ll) returns int {
  int n = 0;
  
  LinkedList? nextLL = ll.next;
  
  while nextLL != () {
    n += 1;
    nextLL = nextLL.next;
  }
  
  return n;
}

//______________________________________________________________________________________________

//10. ARRAYS
//--declaration
int[] v = [1, 2, 3];
//--accessing element
int n = v[1];
//== and != perform deep comparison based on members instead of memory location
//--length
int len = v.length();

//______________________________________________________________________________________________

//9. STRINGS
//no notion for separate character type, character is considered as string with length one
//--functions
string s = "abc".substring(1,2); 
int n = s.length();
//alternative
import ballerina/lang.string
int n = string:length(s);

//______________________________________________________________________________________________

//8. NIL
//null value
int? v = (); //the ? means v can take nil or an int value
//checking
int n = v == () ? 0: v;
//or elvis operator x ?: y return x if x not nil or y otherwise
int n = v ?: 0;
//void function
function foo() returns () {
  return ();
}

//______________________________________________________________________________________________

//7. BOOLEANS AND CONDITIONALS
//--declaration
boolean flag = true;
//similar operators supported as C

//______________________________________________________________________________________________

//6. FLOATING POINT NUMBERS
//--declaration
float x = 1.0;
//--conversion
int n = 2;
float y = x + <float>n;

//______________________________________________________________________________________________

//5. INTEGERS
//support all basic arithmetic operators, comparison operators, compount assignment (+=/-=) and bitwise operators
//no more increment and decrement operators (++ and --)
//--declaration (dec or hexa)
int m = 1;
int n = 0xFFFF;


//______________________________________________________________________________________________

//4. SYNTAX
//comments
//documentation
# Add two integers.
# + x - an integer
# + y - another integer
# + return - the sum of 'x' and 'y'
public function add(int x, int y) returns int {
  return x + y;
}
//to use predefined keywords as variable names, add a single quote before
string 'string = "xyz";

//______________________________________________________________________________________________

//3. FUNCTIONS
//definition
function add(int x, int y) returns int {
  int sum = x + y;
  return sum;
}

//______________________________________________________________________________________________

//2. VARIABLES AND TYPES
//types: integers, floating point numbers, strings, and booleans
//--declaration and usage
string greeting = "Hello";
public function main() {
   string name = "Ballerine";
   io:println(greeting," ",name);
}

//______________________________________________________________________________________________

//1. PROGRAMS AND MODULES
//programs consists of modules and each module contains .bal file(s)

//simple module
import ballerina/io;  //import predefined library modules (<organization>/<modulename>)

public function main() {
  io:println("Hello World!");
}
