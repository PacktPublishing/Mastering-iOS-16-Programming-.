import Foundation
import SwiftUI

// MARK: - Chapter 1: Swift 5.6

protocol Dog {
    func makeSound()
}

struct GoldenRetriever: Dog {
    func makeSound() {
        print("Barking")
    }
}

let dog = GoldenRetriever()
dog.makeSound()


func makeSound<T: Dog>(from dog: T) {
    dog.makeSound()
}

makeSound(from: dog)

let anotherDog: Dog = GoldenRetriever()
anotherDog.makeSound()

func makeSoundWithExistentialType(using dog: Dog) {
    dog.makeSound()
}

let thirdDog: any Dog = GoldenRetriever()
thirdDog.makeSound()

func makeSoundUsingAnyKeyword(from dog: any Dog) {
    dog.makeSound()
}

// MARK: - Chapter 1: Swift 5.6

var someNumbersRelatedToSomeNames1 = [
    "Kamyar": [],
    "Matineh": [],
]

var someNumbersRelatedToSomeNames2: [String: [Int]] = [
    "Kamyar": [],
    "Matineh": [],
]

var someNumbersRelatedToSomeNames3: [_: [Int]] = [
    "Kamyar": [],
    "Matineh": [],
]

struct Human {
    let name: String
}

// MARK: - Chapter 1: Swift 5.6

enum MySocialAccounts: String, Codable, CodingKeyRepresentable {
    case instagram
    case linkedIn
}

var dictionaryOfMySocialAccounts: [MySocialAccounts: String]
dictionaryOfMySocialAccounts = [.instagram: "kamyarelyasi", .linkedIn: "Kamyar Elyasi"]
let encodedAccounts = try! JSONEncoder().encode(dictionaryOfMySocialAccounts)
print(String(decoding: encodedAccounts, as: UTF8.self))

// MARK: - Chapter 1: Swift 5.6

if #unavailable(iOS 15) { // Alternative for #available(iOS 15, *) { } else {
    // Code to make iOS 14 and earlier work correctly
}

// MARK: - Chapter 1: Swift 5.7

var pub: String? = "Packt"

if let pub {
    print("This is a book from \(pub) pub!") // Safely Unwrapped
}

//guard let pub else { return } // Safely Unwrapped
print("This is a book from \(pub) pub!")

// MARK: - Chapter 1: Swift 5.7

let cars = ["Mercedes", "BMW"]

let carsWithMyOpinion = cars.map { car -> String in
    if car == "Mercedes" {
        return "I'm into \(car)"
    } else {
        return "\(car) is not my choice"
    }
}

// MARK: - Chapter 1: Swift 5.7

let someSentence = "Hello, Kamyar. Did you write the book Mastering iOS 16?"

print(someSentence.replacing("Kamyar", with: "Kiarash"))
print(someSentence.replacing(/[a-m]Kamyar/, with: "Kiarash")) // Regular Expression  form of top line
print(someSentence.trimmingPrefix("book"))
print(someSentence.trimmingPrefix(/book/)) // Regular Expression  form of top line
print(someSentence.ranges(of: "iOS"))
print(someSentence.ranges(of: /[a-z]iOS/)) // Regular Expression form of top line

do {
    let iOSWordSearch = try Regex("[a-z]iOS")
    print(someSentence.ranges(of: iOSWordSearch))
} catch {
    print("Failed to create regex")
}

import RegexBuilder


let authorNameReference = Reference(Substring.self)
let bookNameiOSVersionReference = Reference(Int.self)

let search = Regex {
    "Hello, "

    Capture(as: authorNameReference) {
        OneOrMore(.word)
    }

    " Did you write the book Mastering iOS "

    TryCapture(as: bookNameiOSVersionReference) {
        OneOrMore(.digit)
    } transform: { iOSVersion in
        Int(iOSVersion)
    }

}

if let result = someSentence.firstMatch(of: search) {
    print("Name: \(result[authorNameReference])")
    print("Age: \(result[bookNameiOSVersionReference])")
}

// MARK: - Chapter 1: Swift 5.7

func someGenericFunc<T: Sequence>(from options: T = 1...49) -> [T.Element] {
    Array(options.shuffled())
}

// MARK: - Chapter 1: Swift 5.7

protocol City {
    var name: String { get }
    var zipCode: String { get }
    var countryName: String { get }
}

func cityInfoFor(_ city: City) -> (some View, some View, some View) {
    (Text(city.name), Text(city.countryName), Text(city.zipCode))
}

// MARK: - Chapter 1: Swift 5.7

func createCityInfoViews() -> [some View] {
    let cityNames = ["London", "Berlin", "Stockholm"]
    return cityNames.map(Text.init)
}

// MARK: - Chapter 1: Swift 5.7

func isItemsSorted(array: [some Comparable]) -> Bool {
    array == array.sorted()
}
