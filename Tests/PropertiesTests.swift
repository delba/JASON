//
// PropertiesTests.swift
//
// Copyright (c) 2015-2016 Damien (http://delba.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import XCTest
import JASON

class PropertiesTests: XCTestCase {
    func testString() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17
        ]

        // Value is present and convertible
        XCTAssertEqual("Brandon Walsh", json["name"].string!)
        XCTAssertEqual("Brandon Walsh", json["name"].stringValue)

        // Value is not present
        XCTAssertNil(json["nickname"].string)
        XCTAssertEqual("", json["nickname"].stringValue)

        // Value is not convertible
        XCTAssertNil(json["age"].string)
        XCTAssertEqual("", json["age"].stringValue)
    }

    func testIntegerType() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17
        ]

        // Value is present and convertible

        XCTAssertEqual(17, json["age"].int!)
        XCTAssertEqual(17, json["age"].intValue)

        // Value is not present

        XCTAssertNil(json["romances_count"].int)
        XCTAssertEqual(0, json["romances_count"].intValue)

        // Value is not convertible

        XCTAssertNil(json["name"].int)
        XCTAssertEqual(0, json["name"].intValue)
    }

    func testFloatingPointType() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17
        ]

        // Value is present and convertible

        XCTAssertEqual(Double(17), json["age"].double!)
        XCTAssertEqual(Double(17), json["age"].doubleValue)

        XCTAssertEqual(Float(17), json["age"].float!)
        XCTAssertEqual(Float(17), json["age"].floatValue)

        // Value is not present

        XCTAssertNil(json["romances_count"].double)
        XCTAssertEqual(Double(0), json["romances_count"].doubleValue)

        XCTAssertNil(json["romances_count"].float)
        XCTAssertEqual(Float(0), json["romances_count"].floatValue)

        // VAlue is not convertible

        XCTAssertNil(json["name"].double)
        XCTAssertEqual(Double(0), json["name"].doubleValue)

        XCTAssertNil(json["name"].float)
        XCTAssertEqual(Float(0), json["name"].floatValue)
        
        XCTAssertEqual(CGFloat(17), json["age"].cgFloat!)
        XCTAssertEqual(CGFloat(17), json["age"].cgFloatValue)
    }

    func testBool() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "age": 17,
            "cool": true
        ]

        // Value is present and convertible

        XCTAssert(json["cool"].bool!)
        XCTAssert(json["cool"].boolValue)

        // Value is not present

        XCTAssertNil(json["swaggy"].bool)
        XCTAssertFalse(json["swaggy"].boolValue)

        // Value is not convertible

        XCTAssertNil(json["name"].bool)
        XCTAssertFalse(json["name"].boolValue)
    }

    func testDictionary() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "mother": [
                "name": "Cindy Walsh"
            ]
        ]

        // Value is present and convertible

        AssertEqualDictionaries(["name": "Cindy Walsh"], json["mother"].dictionary!)
        AssertEqualDictionaries(["name": "Cindy Walsh"], json["mother"].dictionaryValue)

        // Value is not present

        XCTAssertNil(json["father"].dictionary)
        AssertEqualDictionaries([String: AnyObject](), json["father"].dictionaryValue)

        // Value is not convertible

        XCTAssertNil(json["name"].dictionary)
        AssertEqualDictionaries([String: AnyObject](), json["name"].dictionaryValue)
    }
    
    func testJsonDictionary() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "mother": [
                "name": "Cindy Walsh"
            ]
        ]
        
        var key: String
        
        // Value is present and convertible
        
        key = "mother"
        XCTAssertEqual("Cindy Walsh", json[key].jsonDictionary!["name"]!.string!)
        XCTAssertEqual("Cindy Walsh", json[key].jsonDictionaryValue["name"]!.stringValue)
        
        // Value is not present
        
        key = "father"
        XCTAssert(json[key].jsonDictionary == nil)
        XCTAssert(json[key].dictionaryValue.isEmpty)
        
        // Value is not convertible
        
        key = "name"
        XCTAssert(json[key].jsonDictionary == nil)
        XCTAssert(json[key].jsonDictionaryValue.isEmpty)
    }

    func testArray() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "friends": ["Steve Sanders", "Dylan McKay"]
        ]

        // Value is present and convertible

        AssertEqualArrays(["Steve Sanders", "Dylan McKay"], json["friends"].array!)
        AssertEqualArrays(["Steve Sanders", "Dylan McKay"], json["friends"].arrayValue)

        // Value is not present

        XCTAssertNil(json["romances"].array)
        AssertEqualArrays([AnyObject](), json["romances"].arrayValue)

        // Value is not convertible

        XCTAssertNil(json["name"].array)
        AssertEqualArrays([AnyObject](), json["name"].arrayValue)
    }
    
    func testJsonArray() {
        let json: JSON = [
            "name": "Brandon Walsh",
            "friends": ["Steve Sanders", "Dylan McKay"]
        ]
        
        // Value is present and convertible
        
        AssertEqualArrays(["Steve Sanders", "Dylan McKay"], json["friends"].jsonArray!.map{$0.stringValue})
        AssertEqualArrays(["Steve Sanders", "Dylan McKay"], json["friends"].jsonArrayValue.map{$0.stringValue})
        
        // Value is not present
        
        XCTAssert(json["romances"].jsonArray == nil)
        XCTAssert(json["romances"].jsonArrayValue.isEmpty)
        
        // Value is not convertible
        
        XCTAssert(json["name"].jsonArray == nil)
        XCTAssert(json["name"].jsonArrayValue.isEmpty)
    }

}