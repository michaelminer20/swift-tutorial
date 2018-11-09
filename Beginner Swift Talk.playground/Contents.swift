// Apple's tutorial: https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html

// Variables and constants
var str = "Hello, playground"

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

// Type Annotations
var welcomeMessage: String = "foo"
welcomeMessage = "Hello"

// Related variables on the same line
// var red, green, blue: Double

// Names can be almost anything; they just can't be reserved words (use `` for those),
// and can't start with numbers
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

// Printing variables
print(welcomeMessage)

// Type Inference
let anotherPi = 3 + 0.14159 // anotherPi is also inferred to be of type Double

// Numeric literals
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

let paddedDouble = 000123.456

// _ as comma in natural writing number
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// Type conversion
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// Arrays
let numbers = [1, 2, 3] // Array literal
let empty = [Int]() // Empty array
let empty2: [Int] = [] // Another empty array
var filled = Array(repeating: "foofoo", count: 3) // Three foofoos

// The above types don't have to be Ints or Strings; they can be anything

numbers[1]
filled[2]

filled += ["baz"] // Array concatenation
filled[3]

// Iterating over arrays
for item in filled {
	print("Item: \(item)")
}

for (index, item) in filled.enumerated() { // Like forEachIndexed in kotlin
	print("Item: \(item); index: \(index)")
}

// Dictionaries
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"

namesOfIntegers = [:] // Type already specified, so this works

namesOfIntegers = [
	16: "sixteen",
	3: "three"
] // Dictionary literal

// Another literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// Ranges
let base = 3
let power = 10
var answer = 1
for _ in 1...power { // ... is inclusive, ..< excludes last number
	answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

// Optionals
// Swift wants to eliminate NullPointerExceptions
var number: Int? // Could be nil, or could be a number
number = 3 // number is now Optional(3)
number! // Force unwrap; returns 3, or crashes if number is nil

if let number = number {
	print(number) // Prints 3, because number can be unwrapped safely
}

// Classes and Structures
struct SomeStructure {
	let a: Int
	let b: String
}
class SomeClass {
	// class definition goes here
}

// Structures come with a free initilizer; classes do not
let foo = SomeStructure(a: 1, b: "asdf")

// Value vs Reference types

// A value type is a type whose value is copied when it’s assigned to a
// variable or constant, or when it’s passed to a function. Structs and
// Enumerations are value types.

// A reference type is a type whose reference is copied when it’s assigned to a
// variable or constant, or when it’s passed to a function. Classes are reference
// types. This is the same as all Objects in java.

class Person {
	let name: String
	var laptop: Laptop?
	
	init(name: String) {
		self.name = name
	}
	
	deinit {
		print("Deinitializing Person \(name)")
	}
}

class Laptop {
	let model: String
	unowned var owner: Person
	
	init(model: String, owner: Person) {
		self.model = model
		self.owner = owner
	}
	
	deinit {
		print("Deinitializing Laptop \(model)")
	}
}

do { // Playgrounds crashes when I type do, so I have to scope with this mess
	let person = Person(name: "Bob")
	let laptop = Laptop(model: "Apple", owner: person)
	person.laptop = laptop
}

// By now, we would expect to see some deinitialization
print("There should be some deinits now")
