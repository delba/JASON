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
    func testJASON_100() {
        measureBlock {
            for _ in 0..<100 {
                let json = JASON.JSON(object)
                let _ = Struct(jason: json)
            }
        }
    }
    
    func testSwiftyJSON_100() {
        measureBlock {
            for _ in 0..<100 {
                let json = SwiftyJSON.JSON(object)
                let _ = Struct(swityJson: json)
            }
        }
    }
    
    func testJASON_1000() {
        measureBlock {
            for _ in 0..<1_000 {
                let json = JASON.JSON(object)
                let _ = Struct(jason: json)
            }
        }
    }
    
    func testSwiftyJSON_1000() {
        measureBlock {
            for _ in 0..<1_000 {
                let json = SwiftyJSON.JSON(object)
                let _ = Struct(swityJson: json)
            }
        }
    }
    
    
    func testJASON_10000() {
        measureBlock {
            for _ in 0..<10_000 {
                let json = JASON.JSON(object)
                let _ = Struct(jason: json)
            }
        }
    }
    
    func testSwiftyJSON_10000() {
        measureBlock {
            for _ in 0..<10_000 {
                let json = SwiftyJSON.JSON(object)
                let _ = Struct(swityJson: json)
            }
        }
    }
    
}
