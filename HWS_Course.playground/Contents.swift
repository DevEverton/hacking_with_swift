//: Playground - noun: a place where people can play

import UIKit


//Challenge 1 - Unique letters
//My solution

var str = "No duplicates"

func uniqueLetters(string: String) -> Bool {
    var set: Set<Character> = []
    for char in string {
        set.insert(char)
    }
    if string.count == set.count {
        return true
    }
    return false
}

uniqueLetters(string: str)

//Teacher solution

func uniqueLettersShorter(string: String) -> Bool {
    return Set(string).count == string.count
}
uniqueLettersShorter(string: str)


//Challenge 2 - Palindrome string
//My solution

let input = "ELe"

func isPalindrome(input: String) -> Bool {
    let lowerCased = input.lowercased()
    return String(lowerCased.reversed()) == lowerCased
}

isPalindrome(input: input)

//Teacher solution == my solution


//Challenge 3 - Same letters strings
//My solution

var str1 = "TTbc"
var str2 = "b c"

func compare(string1: String, string2: String) -> Bool{
    let newStr1 = string1.replacingOccurrences(of: " ", with: "")
    let newStr2 = string2.replacingOccurrences(of: " ", with: "")
    return newStr1.sorted() == newStr2.sorted()
}

compare(string1: str1, string2: str2)

//Teacher solution

func compare2(string1: String, string2: String) -> Bool{
    let array1 = Array(string1)
    let array2 = Array(string2)
    return array1.sorted() == array2.sorted()
}

compare2(string1: str1, string2: str2)

//Challenge 4 - One string inside another string
//My solution

extension String {
    func fuzzyContains(string: String) -> Bool{
        let lowerCased = string.lowercased()
        let lowerCasedSelf = self.lowercased()
        if let _ = lowerCasedSelf.range(of: lowerCased) {
            return true
        }
        return false
    }
}

"Excelent Job".fuzzyContains(string: "Excelent")

//Teacher Solution

extension String {
    func fuzzyContains2(string: String) -> Bool {
        return self.uppercased().range(of: string.uppercased()) != nil
    }
    
    func fuzzyContains3(string: String) -> Bool {
        return range(of: string, options: .caseInsensitive) != nil
    }
}


//Chalenge 5 - Number of times the letter appears on a string
//My solution

extension Character {
    func howMuchAppears(in string: String) -> Int {
        let result = string.filter { char in
            char == self
        }
        return result.count
    }
}



//Teacher solution

func howMuchAppears2(input: String, count: Character) -> Int {
    return input.reduce(0) {
        $1 == count ? $0 + 1 : $0
    }
}



howMuchAppears2(input: "abpiAndja", count: "a")

//Challenge 6 - Remove Duplicate Letters
//My Solution

func removeDuplcateLetters(of string: String) -> String{
    var usedLetter = [Character]()
    for letter in string {
        if !usedLetter.contains(letter) {
            usedLetter.append(letter)
        }
    }
    return String(usedLetter)
}


//Teacher solution

func removeDuplcateLetters2(of string: String) -> String{
    var used = [Character:Bool]()
    let result = string.filter {
        used.updateValue(true, forKey: $0) == nil
    }
    return String(result)
}


removeDuplcateLetters2(of: "boollaa")


//Chalenge 7 - Remove consecutive spaces
//My solution

func removeConsecutiveSpaces(of string: String) -> String {
    return string.replacingOccurrences(of: "   ", with: " ").replacingOccurrences(of: "  ", with: " ")
}


removeConsecutiveSpaces(of: "    c")

//Teacher solution

func removeConsecutiveSpaces2(of string: String) -> String {
    return string.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

//Challenge 8 - String rotation
//My solution


func isRotated(string: String, rotated: String) -> Bool {
    if rotated.count != string.count {
        return false
    }
    var array = Array(string)
    for _ in 0..<array.count {
        if let tempElement = array.last {
            array.removeLast()
            array.insert(tempElement, at: 0)
            if String(array) == rotated {
                return true
            }
        }
    }
    return false
}


isRotated(string: "abcd", rotated: "cdab")

//Chalenge 9 - Find a pangram
//My solution

let frase = "The quick brown fox jumps over the lazy dog"

func findPingram(string: String) -> Bool {
    let alphabet: Array<Character> = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    for letter in alphabet {
        if !string.contains(letter) {
            return false
        }
    }
    return true
}


findPingram(string: frase)

func findPingram2(string: String) -> Bool {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let mapped = alphabet.map{
        string.lowercased().contains($0)
    }
    if mapped.contains(false) {
        return false
    }
    return true
}

findPingram2(string: frase)


//Teacher Solution

func findPingram3(string: String) -> Bool {
    let set = Set(string.lowercased())
    let letters = set.filter{ $0 >= "a" && $0 <= "z" }
    return letters.count == 26
}

//Challenge 10 - Find vowels and consonants
//My solution

func findVowelsAndConsonants(of string: String ) -> (vogais: Int, consoantes: Int) {

    let vogais = "aeiou"
    let consoantes = "bcdfghjklmnpqrstvwxyz"
    var counterV = 0
    var counterC = 0
    for letter in string {
        if vogais.contains(letter) {
            counterV += 1
        }else if consoantes.contains(letter) {
            counterC += 1
        }
    }
    return (counterV,counterC)
}

findVowelsAndConsonants(of: "aaaaabb")

//Teacher solution == my solution

//Challenge 11 - Three different letters
//My solution

func threeDifferentLetters(string1: String, string2: String) -> Bool{

    guard string1.count == string2.count else { return false }
    
    let arr1 = Array(string1)
    let arr2 = Array(string2)
    var difCounter = 0
    
    for i in 0..<arr1.count {
        if arr1[i] != arr2[i] {
            difCounter += 1
            if difCounter > 3 {
                return false
            }
        }

    }
    return true
}

threeDifferentLetters(string1: "Clamp", string2: "Grams")


//Teacher solution == My solution

//Challente 12 - find longest prefix
//My solution

func findPrefix(of string: String) -> String {
    
    guard !string.isEmpty else { return "" }
    
    let array = string.split(separator: " ").map{ Array(String($0))}
    var letters = ""
    var diffLetters = ""
    var result = ""

    for i in 0..<array.first!.count {
        for j in 0..<array.count{
            letters.append(array[j][i])
        }
        diffLetters = letters.filter{ $0 != letters.first! }
        if diffLetters.isEmpty {
            result.append(letters.first!)
        }else {
            return result
        }
        letters.removeAll()
    }
    return result
}


let strin = "bolada bolacha bolaca bolama"

findPrefix(of: strin)

//Teacher solution

func findPrefix2(string: String) -> String {
    let parts = string.components(separatedBy: " ")
    guard let first = parts.first else { return "" }
    
    var currentPrefix = ""
    var bestPrefix = ""
    
    for letter in first.characters {
        currentPrefix.append(letter)
        
        for word in parts {
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }
        bestPrefix = currentPrefix
    }

    return bestPrefix
}

findPrefix2(string: strin)

