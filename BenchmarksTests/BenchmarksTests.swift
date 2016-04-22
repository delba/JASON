//
//  BenchmarksTests.swift
//  BenchmarksTests
//
//  Created by Damien on 15/07/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit
import XCTest

import JASON
import SwiftyJSON

struct Struct {
    let string: String
    let int: Int
    let double: Double
    let float: Float
    let bool: Bool
    let array: [AnyObject]
    let dictionary: [String: AnyObject]
    let optionalFloat: Float?
    let optionalString: String?
    let optionalInt: Int?
    let optionalDouble: Double?
    let optionalBool: Bool?
    let optionalArray: [AnyObject]?
    let optionalDictionary: [String: AnyObject]?
    
    init(jason json: JASON.JSON) {
        string = json["string"].stringValue
        int = json["int"].intValue
        double = json["double"].doubleValue
        float = json["float"].floatValue
        bool = json["bool"].boolValue
        array = json["array"].arrayValue
        dictionary = json["dictionary"].dictionaryValue
        optionalString = json["string"].string
        optionalInt = json["int"].int
        optionalDouble = json["double"].double
        optionalFloat = json["float"].float
        optionalBool = json["bool"].bool
        optionalArray = json["array"].array
        optionalDictionary = json["dictionary"].dictionary
    }
    
    init(swityJson json: SwiftyJSON.JSON) {
        string = json["string"].stringValue
        int = json["int"].intValue
        double = json["double"].doubleValue
        float = json["float"].floatValue
        bool = json["bool"].boolValue
        array = json["array"].arrayObject ?? [AnyObject]()
        dictionary = json["dictionary"].dictionaryObject ?? [String: AnyObject]()
        optionalString = json["string"].string
        optionalInt = json["int"].int
        optionalDouble = json["double"].double
        optionalFloat = json["float"].float
        optionalBool = json["bool"].bool
        optionalArray = json["array"].arrayObject
        optionalDictionary = json["dictionary"].dictionaryObject
    }
}

let object: AnyObject = [
    "string": "string",
    "int": 42,
    "double": 42,
    "float": 42,
    "bool": true,
    "array": ["one", "two", "three"],
    "dictionary": ["string": "string", "int": 42]
]

class BenchmarksTests: XCTestCase {
    func testJASON100() {
        measureBlock {
            for _ in 0..<100 {
                let json = JASON.JSON(object)
                let _ = Struct(jason: json)
            }
        }
    }
    
    func testSwiftyJSON100() {
        measureBlock {
            for _ in 0..<100 {
                let json = SwiftyJSON.JSON(object)
                let _ = Struct(swityJson: json)
            }
        }
    }
    
    func testJASON1_000() {
        measureBlock {
            for _ in 0..<1_000 {
                let json = JASON.JSON(object)
                let _ = Struct(jason: json)
            }
        }
    }
    
    func testSwiftyJSON1_000() {
        measureBlock {
            for _ in 0..<1_000 {
                let json = SwiftyJSON.JSON(object)
                let _ = Struct(swityJson: json)
            }
        }
    }
    
    
    func testJASON10_000() {
        measureBlock {
            for _ in 0..<10_000 {
                let json = JASON.JSON(object)
                let _ = Struct(jason: json)
            }
        }
    }
    
    func testSwiftyJSON10_000() {
        measureBlock {
            for _ in 0..<10_000 {
                let json = SwiftyJSON.JSON(object)
                let _ = Struct(swityJson: json)
            }
        }
    }
    
}
