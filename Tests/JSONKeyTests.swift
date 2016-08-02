//
// JSONKeyTests.swift
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

extension JSONKeys {
    static let string = JSONKey<String>("string")
    static let optional_string = JSONKey<String?>("optional_string")
    static let int = JSONKey<Int>("int")
    static let optional_int = JSONKey<Int?>("optional_int")
    static let double = JSONKey<Double>("double")
    static let optional_double = JSONKey<Double?>("optional_double")
    static let float = JSONKey<Float>("float")
    static let optional_float = JSONKey<Float?>("optional_float")
    static let cgFloat = JSONKey<CGFloat>("float")
    static let optional_cgFloat = JSONKey<CGFloat?>("float")
    static let nsNumber = JSONKey<NSNumber>("float")
    static let optional_nsNumber = JSONKey<NSNumber?>("optional_float")
    static let bool = JSONKey<Bool>("bool")
    static let optional_bool = JSONKey<Bool?>("optional_bool")
    static let array = JSONKey<[AnyObject]>("array")
    static let optional_array = JSONKey<[AnyObject]?>("optional_array")
    static let dictionary = JSONKey<[String: AnyObject]>("dictionary")
    static let optional_dictionary = JSONKey<[String: AnyObject]>("optional_dictionary")
    static let arrayJSON = JSONKey<[JSON]>("arrayJSON")
    static let optional_arrayJSON = JSONKey<[JSON]?>("optional_arrayJSON")
    static let dictionaryJSON = JSONKey<[String: JSON]>("dictionaryJSON")
    static let optional_dictionaryJSON = JSONKey<[String: JSON]?>("optional_dictionaryJSON")
    static let json = JSONKey<JSON>("json")
    static let date = JSONKey<Date?>("date")
}

class JSONKeyTests: XCTestCase {
    func testStaticSubscripts() {
        let json: JSON = [
            "string": "string",
            "optional_string": "string",
            "int": 42,
            "optional_int": 42,
            "double": 4.2,
            "optional_double": 4.2,
            "float": 4.2,
            "optional_float": 4.2,
            "bool": true,
            "optional_bool": true,
            "array": ["string", 42, 4.2, true],
            "optional_array": ["string", 42, 4.2, true],
            "dictionary": ["string": 42],
            "optional_dictionary": ["string": 42],
            "date": "2016-04-12T13:29:32"
        ]
        
        XCTAssertEqual("string", json[.string])
        XCTAssertEqual("string", json[.optional_string])
        XCTAssertEqual(42, json[.int])
        XCTAssertEqual(42, json[.optional_int])
        XCTAssertEqual(4.2, json[.double])
        XCTAssertEqual(4.2, json[.optional_double])
        XCTAssertEqual(4.2, json[.float])
        XCTAssertEqual(4.2, json[.optional_float])
        XCTAssertEqual(NSNumber(value: 4.2), json[.optional_nsNumber])
        XCTAssertEqual(NSNumber(value: 4.2), json[.nsNumber])
        XCTAssertEqual(true, json[.bool])
        XCTAssertEqual(true, json[.optional_bool])
        AssertEqualArrays(["string", 42, 4.2, true], json[.array])
        AssertEqualArrays(["string", 42, 4.2, true], json[.optional_array]!)
        AssertEqualDictionaries(["string": 42], json[.dictionary])
        AssertEqualDictionaries(["string": 42], json[.optional_dictionary])
        
        JSON.dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        XCTAssertEqual(formatter.date(from: "2016-04-12T13:29:32"), json[.date])
    }
    
    func testPath() {
        let json: JSON = [
            "user": [
                "name": "Jason",
                "nicknames": [
                    "J"
                ]
            ]
        ]
        
        let name = JSONKey<String>(path: "user", "name")
        let nickname = JSONKey<String>(path: "user", "nicknames", 0)
        XCTAssertEqual("Jason", json[name])
        XCTAssertEqual("J", json[nickname])
    }
}
