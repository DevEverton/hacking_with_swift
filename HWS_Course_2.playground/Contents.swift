//: Playground - noun: a place where people can play

import UIKit

//Challenge 13 - Run-Lenght enconding
//My solution

func encodeLenght(string: String) -> String {
    
    guard !string.isEmpty else {return ""}
    
    for letter in string {
        string.filter { $0 == letter }
    }
    
    
    return ""
}

let string = "aabcc"
var currentLetter: Character?
var counter = Int()
var result = String()

//teacher solution
for letter in string {
    if letter == currentLetter {
        counter += 1
        
    }else {
        if let current = currentLetter {
            result.append("\(current)\(counter)")

        }
        currentLetter = letter
        counter = 1
    }

}
if let current = currentLetter {
    result.append("\(current)\(counter)")
}

print(result)

//Challenge 14 - Print all permutations
//My solution

let str = "abcd"

func getAllpermutations(string: String) {
    var ar = Array(string)
    
}


//Challenge 15 - Reverse the words in a string
//My solution

var string2 = "Everton Lopes Carneiro cunha da costa jose da silva"


func reverseLetters(of string: String) -> String {
    
    let arrStr = Array(String(string.reversed()).split(separator: " ").reversed())
    let result = arrStr.reduce("") {String($0) + " " + String($1)}
    
    return String(result.dropFirst())
}


reverseLetters(of: string2)


//Challenge 16 - Fizz buzz
//My solution

func fizzBuzz(){
    for i in 1...100 {
        if i%3 == 0 && i%5 == 0 {
            print("FizzBuzz")
        }else if i%5 == 0 {
            print("Buzz")
        }else if i%3 == 0 {
            print("Fizz")
        }else {
            print(i)
        }
    }
}


//Challenge 17 - Random number
//My solution

func generateRandomNumberBetween(_ minimum: Int, _ maximum: Int) -> Int {
    
    var random = UInt32()
    repeat {
        random = arc4random_uniform(UInt32(maximum + 1))
    } while random < minimum
    
    return Int(random)
}

generateRandomNumberBetween(5,12)

//Teacher solution

func generateRandom(_ minimum: Int, _ maximum: Int) -> Int {
    return Int(arc4random_uniform(UInt32(maximum - minimum + 1))) + minimum
}


//Challenge 18 - Recreate pow() function

pow(2.0, 3.1)

func myPowxx(_ number1: Int, _ number2: Int) -> Int {
    return Int(pow(Double(number1), Double(number2)))
}

myPowxx(2, 4)

func myPow(_ number1: Int, _ number2: Int) -> Int {
    
    var result = 1
    for _ in 1...number2 {
        result *= number1
    }
    
    return result
}

myPow(2, 4)

//Teacher recursive solution

func myPowRecursive(_ number1: Int, _ number2: Int) -> Int {
    
    
    if number2 == 1 { return number1 }
    
    return number1 * myPowRecursive(number1, number2 - 1)
    
}

myPowRecursive(2, 4)

//Challenge 19 - Swap two numbers without using a temporary variable
//My solution

var a = 1
var b = 2
a = a + b
b = a - b
a = a - b

(a,b) = (b,a)

//Challenge 20 - find primes
//My solution

func findPrime(number: Int) -> Bool{
    guard number > 1 else { return false }
    
    for n in 2..<number {
        if number % n == 0 {
            return false
        }
    }

    return true
}


findPrime(number: 7)


//Challenge 21 - Find the lowest and the highest binary number which has the same number of 1s compared to a given number
//My solution

let number = 28

let binaryStr = String(number, radix: 2)
let arrayOfOnes = binaryStr.filter { $0 == "1" }

var counterMain = arrayOfOnes.count
var counterToCompare = 0
var i = number - 1

while i > 0 {
    let lowest = String(i, radix: 2).filter { $0 == "1"}
    counterToCompare = lowest.count
    if counterToCompare == counterMain {
        print("The lowest with the same number of 1s is:", i)
        break
    }
    i -= 1
}
i = number + 1

while i > number {
    let highest = String(i, radix: 2).filter { $0 == "1"}
    counterToCompare = highest.count
    if counterToCompare == counterMain {
        print("The highest with the same number of 1s is:", i)
        break
    }
    i += 1
}


